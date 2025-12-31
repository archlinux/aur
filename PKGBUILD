# Maintainer: Livaiyena <livaiyena@users.noreply.github.com>

pkgname=sessionmanager
pkgver=0.0.7
pkgrel=1
pkgdesc="cli activity tracker for hyprland"
arch=('any')
url="https://github.com/livaiyena/sessionmanager"
license=('GPL-3.0-or-later')
depends=('python' 'python-setuptools' 'hyprland')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=(
    'bash-completion: bash completion'
    'zsh-completions: zsh completion'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/livaiyena/sessionmanager/archive/v$pkgver.tar.gz")
sha256sums=('039a9f79382a7225e62424e61fe94c3aad7b3471e969ea96078190d21f656e08')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    
    # install python package
    python -m installer --destdir="$pkgdir" dist/*.whl

    # install extra files
    install -Dm0644 sessionmanager.service "$pkgdir/usr/lib/systemd/user/sessionmanager.service"
    install -Dm0644 completions/sessionmanager.bash "$pkgdir/usr/share/bash-completion/completions/sessionmanager"
    install -Dm0644 completions/_sessionmanager "$pkgdir/usr/share/zsh/site-functions/_sessionmanager"
    install -Dm0644 completions/sessionmanager.fish "$pkgdir/usr/share/fish/vendor_completions.d/sessionmanager.fish"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
