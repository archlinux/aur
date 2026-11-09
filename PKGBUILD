# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>
# Contributor: Ryan Farley <ryan.farley@gmx.com>
# Contributor: Thomas Sänger <thomas+aur@gecko.space>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Morgan LEFIEUX <comete_AT_archlinuxfr.org>

pkgname=ubi_reader
pkgver=0.8.16
pkgrel=1
pkgdesc='Collection of Python scripts for reading information about and extracting data from UBI and UBIFS images.'
arch=('any')
url="https://github.com/onekey-sec/ubi_reader"
license=("GPL-3.0-or-later")
depends=(python python-lzo python-lzallright python-cryptography python-zstandard)
makedepends=(python-build python-installer python-wheel python-poetry)
checkdepends=(python-pytest python-pytest-cov)
source=("$pkgname-$pkgver.tar.gz::https://github.com/onekey-sec/ubi_reader/archive/refs/tags/$pkgver.tar.gz")
b2sums=('ec5b9c8191495955bbc64e1e86136f7f2c5cdb81913c730c81b42b74d43f9ac57e2e935deb749e29a3430f6d272b9aabe1308e10ed64713d18354817ef5cf3e6')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname-$pkgver"
    poetry run pytest
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
