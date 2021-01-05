# Maintainer: tuberry

_version=1.0.0
_srcname=dict-ecdict
_csvname=ultimate.csv
_zipname=ecdict-ultimate-csv.zip
pkgname=dict-ecdict-git
pkgver=1.0.0.r8.4c4a2ed
pkgrel=1
pkgdesc="A port of Ultimate ECDICT database for dictd et al."
arch=('any')
url="https://github.com/skywind3000/ECDICT-ultimate"
license=('MIT')
depends=('dictd')
makedepends=('dictd' 'git' 'curl' 'python' 'unzip')
provides=('dict-ecdict')
conflicts=('dict-ecdict')
install=${pkgname}.install
source=("${_zipname}::${url}/releases/download/${_version}/${_zipname}"
        "git+https://github.com/tuberry/${_srcname}")
# noextract=("${_zipname}")
sha512sums=('c9353d793c28ee22a40924ed1deb98327ca12c270be0b2bc94de1d66cd582d2bf8f13eb835a787f7ecf144b9a69813024edd5385d2d6e9b4adfeaa79926c95cc'
            'SKIP')

pkgver()
{
  cd ${_srcname}
  printf "%s.r%s.%s" "${_version}" "$( git rev-list --count HEAD )" "$( git rev-parse --short HEAD )"
}

build()
{
  cd ${_srcname}
  make clean
  ln -sf ${srcdir}/ultimate.csv ecdict.csv
  make
}

package()
{
  cd ${_srcname}
  make DESTDIR=${pkgdir} install
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${_srcname}/LICENSE
}
