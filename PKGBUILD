# Maintainer: Paul Barker <paul@pbarker.dev>

pkgname=mirrorshades
pkgver=0.2.0
pkgrel=1
pkgdesc='A tool for mirroring data from remote sources.'
arch=('any')
url='https://github.com/unnecessary-abstraction/mirrorshades'
license=('Apache' 'custom:CC-BY-4.0' 'custom:CC0-1.0')
changelog=ChangeLog.md

source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('bf53677914e227c07644d09317b4acb94692b44393acfd15efdb86b4b92d777c')
b2sums=('aaef9165181a37c79cc1466952ad8d104414ba2e1519ac84ebf2757925d04d2ccfc206af305fb5cdeff8e49bee23bac0c58c964730f3e701d6d72c579dc2fd08')

makedepends=(python-build python-installer python-wheel)
depends=(python python-yaml python-desert)
optdepends=(
    'git: Mirroring git repositories'
    'python-pygithub: Mirroring from GitHub'
    'python-gitlab: Mirroring from GitLab'
    'rclone: Mirroring from rclone remotes'
)

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSES/Apache-2.0.txt "$pkgdir/usr/share/licenses/$pkgname/Apache-2.0"
    install -Dm644 LICENSES/CC-BY-4.0.txt "$pkgdir/usr/share/licenses/$pkgname/CC-BY-4.0"
    install -Dm644 LICENSES/CC0-1.0.txt "$pkgdir/usr/share/licenses/$pkgname/CC0-1.0"
}
