# Maintainer: tuberry

_srcname=dict-cedict
pkgname=dict-cedict-git
pkgver=20201117.r5.255bb57
pkgrel=1
pkgdesc="A port of CC-CEDICT database for dictd et al."
arch=('any')
url="https://www.mdbg.net/chinese/dictionary?page=cc-cedict"
license=('CCPL')
optdepends=('dictd: dict client and server')
makedepends=('dictd' 'git' 'python' 'curl' 'gzip')
provides=('dict-cedict')
conflicts=('dict-cedict')
install=${pkgname}.install
source=("git+https://github.com/tuberry/${_srcname}")
sha512sums=('SKIP')

pkgver()
{
    cd ${_srcname}
    printf "%s.r%s.%s" \
        "$( curl ${url} 2>&1 | grep Latest | grep -Eo '[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}' | tr -d '-' )" \
        "$( git rev-list --count HEAD )" \
        "$( git rev-parse --short HEAD )"
}

package()
{
    cd ${_srcname}
    make DESTDIR=${pkgdir} install
}
