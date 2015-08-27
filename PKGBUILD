# Maintainer: Arthur Vuillard <arthur@hashbang.fr>
pkgname=postgresql-multicorn
pkgver=1.2.3
pkgrel=1
pkgdesc="Python Wrapper for Postgresql 9.2+ Foreign Data Wrapper"
url="http://multicorn.org/"
arch=('x86_64' 'i686')
license=('Postgresql')
depends=('postgresql>=9.2')
makedepends=()

_github_name="Multicorn"
_github_tag="v${pkgver}"

source=(
    "https://github.com/Kozea/${_github_name}/archive/${_github_tag}.zip"
)

md5sums=('e6be80a309f0fb0ca15e0802f8ddf893')

build(){
    cd ${srcdir}/${_github_name}-${pkgver}
    make
}

package(){
    cd ${srcdir}/${_github_name}-${pkgver}
    python setup.py install --root="$pkgdir/"

    mkdir -p ${pkgdir}/usr/lib/postgresql
    mkdir -p ${pkgdir}/usr/share/postgresql/extension

    cp sql/multicorn--${pkgver}.sql multicorn.control ${pkgdir}/usr/share/postgresql/extension
    chmod 644 ${pkgdir}/usr/share/postgresql/extension/*
    cp multicorn.so ${pkgdir}/usr/lib/postgresql
}
