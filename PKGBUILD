# Maintainer: Kimiblock Moe

pkgname=jose-bot-git
pkgdesc="Jose bot (Join confirm bot)"
url="https://github.com/ShadowRZ/jose-bot"
license=(Apache-2.0)
arch=(any)
pkgver=r18.958a175
pkgrel=1
makedepends=(python-setuptools git)
depends=(python python-xxhash python-yaml python-matrix-nio)
optdepends=(postgresql-libs)
source=(
	"git+https://github.com/ShadowRZ/jose-bot.git"
)
md5sums=(
	"SKIP"
)
provides=(jose-bot)

function pkgver() {
	cd "${srcdir}/jose-bot"
	git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

function build() {
	cd "${srcdir}/jose-bot"
	python -m build --wheel --no-isolation
}

function package() {
	cd "${srcdir}/jose-bot"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}

