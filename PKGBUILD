# Maintainer: AlphaLynx <alphalynx@protonmail.com>
# Contributor: Zen <dev@pyl.onl>

pkgname=ugrd
pkgver=2.0.1
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
b2sums=('2a4644b31dbf7496ba6aec0c01508731a89fcf242cdc85a9a65b52d4d2a826bebf67828b1fd34a8e00186cc9556b2fee3aa8f4d37ad88635c109764b7d4a1a11')

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
