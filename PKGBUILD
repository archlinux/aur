
# Maintainer: nano thirteen <nano13@gmx.net   >

_pkgname=('kimai')
pkgname=${_pkgname}-git
pkgver=1.1.0.r206.gab8c2a92
pkgrel=1
pkgdesc="Kimai is a free open source timetracker"
url="http://www.kimai.org/"
arch=('any')
license=('GPL')
depends=('php' 'mariadb')
makedepends=('git')
source=("${pkgname}"::"git+https://github.com/kimai/kimai.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/../${pkgname}"
    # converting bare git repo to nonbare
    # https://stackoverflow.com/questions/10637378/how-do-i-convert-a-bare-git-repository-into-a-normal-one-in-place
    mkdir .git
    mv ./* .git
    git config --local --bool core.bare false
    git reset --hard
    # clean up a little bit
    rm -r .git
    rm -r .github
    mkdir -p "${pkgdir}/usr/share/webapps/"
    cd ..
    mv "${pkgname}" "${_pkgname}"
    mv "${srcdir}/../${_pkgname}" "${pkgdir}/usr/share/webapps/"
}
