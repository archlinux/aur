# Maintainer: AlphaLynx <alphalynx@protonmail.com>
# Contributor: Zen <dev@pyl.onl>

pkgname=ugrd
pkgver=2.0.0
pkgrel=1
pkgdesc='Minimalistic POSIX initramfs generator, designed for encrypted systems'
arch=('any')
url="https://github.com/desultory/$pkgname"
license=('GPL-2.0-only')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
depends=('bc' 'pax-utils' 'python' 'python-pycpio' 'python-zenlib')
optdepends=('python-zstandard: zstd cpio compression')
provides=('initramfs')
backup=("etc/$pkgname/config.toml")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('1275ca182c10bf2fb4aaad8e819af1142bfee2c98bb1c054a4e9edd2b8a19cb32aa22eceab7cb024006708b4414b442e692d3fd6ab42c56cdbff9bd739e21765')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 examples/example.toml "$pkgdir/etc/$pkgname/config.toml"
    install -Dm644 completion/ugrd "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 completion/_ugrd "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    install -Dm644 hooks/alpm/91-ugrd.hook "$pkgdir/usr/share/libalpm/hooks/91-$pkgname.hook"
}

# vim: set ts=4 sw=4 sts=4 et:
