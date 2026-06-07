cat << 'EOF' > PKGBUILD
# Maintainer: Shrike Linux Uganda <rootied@proton.me>
pkgname=shrike-control-center
pkgver=1.3
pkgrel=1
pkgdesc="Shrike Control Centre - Secure Web-Based Server & File Manager GUI"
arch=('any')
url="https://shrikelinuxug.org"
license=('GPL3')
install=shrike-control-center.install
depends=('python' 'python-flask' 'python-psutil' 'firefox')

source=("https://codeberg.org/root1/Shrike-Linux-Uganda/archive/v${pkgver}.tar.gz"
        "shrike-cc.service"
        "shrike-control-center.desktop"
        "shrike-control-center-autostart.desktop")

md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
    cd "$srcdir/Shrike-Linux-Uganda/shrike-control-center"
    
    install -Dm755 shrike-cc.py "$pkgdir/usr/share/shrike-cc/shrike-cc.py"
    install -Dm644 dashboard.html "$pkgdir/usr/share/shrike-cc/templates/dashboard.html"
    
    cd "$srcdir"
    
    install -Dm644 shrike-cc.service "$pkgdir/etc/systemd/system/shrike-cc.service"
    install -Dm644 shrike-control-center.desktop "$pkgdir/usr/share/applications/shrike-control-center.desktop"
    install -Dm644 shrike-control-center-autostart.desktop "$pkgdir/etc/xdg/autostart/shrike-control-center-autostart.desktop"
}
EOF