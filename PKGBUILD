# Maintainer: Zubkov Artem <goreshit9999@gmail.com>
# Contributor: Zubkov Artem <goreshit9999@gmail.com>

pkgname=sysadmin-vim
pkgver=1.0.0
pkgrel=1
pkgdesc="Minimalistic yet powerful Vim configuration for sysadmins. Pre-configured with essential plugins and sane defaults."
arch=('any')
url="https://github.com/rtXrtXrtX/sysadmin-vim"
license=('MIT')
depends=('gvim' 'git' 'curl')
optdepends=(
    'python: for YouCompleteMe Python support'
    'nodejs: for YouCompleteMe JavaScript support'
    'go: for YouCompleteMe Go support'
)
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/rtXrtXrtX/sysadmin-vim/archive/v$pkgver.tar.gz")
sha256sums=('1dfaef668078fbbca504bb4cca1f96a4693d460916ed53c33ef8503fb965da99')  # После первого релиза заменишь на реальную сумму

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Создаём директории
    install -dm755 "$pkgdir/etc/sysadmin-vim"
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    
    # Копируем конфиги
    install -Dm644 vimrc "$pkgdir/etc/sysadmin-vim/vimrc"
    
    # Копируем документацию
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/doc/$pkgname/LICENSE"
    
    # Скрипт-установщик
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/install-sysadmin-vim" << 'EOF'
#!/bin/bash
echo "Installing sysadmin-vim configuration..."
cp /etc/sysadmin-vim/vimrc ~/.vimrc
mkdir -p ~/.vim/{undo,backup,swap}
echo "Done! Run vim and execute :PlugInstall"
EOF
    chmod +x "$pkgdir/usr/bin/install-sysadmin-vim"
}
