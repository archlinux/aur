# Maintainer: tuberry

pkgname=dict-cedict
pkgver=20201115
pkgrel=1
pkgdesc="A port of CC-CEDICT database for Dictd"
arch=('any')
url="https://www.mdbg.net/chinese/dictionary?page=cc-cedict"
license=('CCPL')
depends=('dictd')
makedepends=('dictd' 'git' 'python' 'curl' 'gzip')
install=${pkgname}.install
source=("git+https://github.com/tuberry/${pkgname}")
sha512sums=('SKIP')

pkgver()
{
    printf "%s\n" \
        "$( curl ${url} 2>&1 | grep Latest | grep -Eo '[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}' | tr -d '-' )"
}

package()
{
    cd ${pkgname}
    make DESTDIR=${pkgdir} install
}
