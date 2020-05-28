# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: JJDaNiMoTh <jjdanimoth.aur@gmail.com>
# Contributor: zlowly <zlowly [at] archlinux.org>
# Contributor: bohoomil <@zoho.com>

pkgname=ttf-wqy-zenhei-ibx
_name=wqy-zenhei
pkgver=0.9.45
pkgrel=7
pkgdesc="A Hei Ti Style (sans-serif) Chinese Outline Font"
arch=('any')
license=(GPL2,custom:"font embedding exception")
url="http://wenq.org/enindex.cgi"
depends=('fontconfig')
groups=('infinality-bundle-fonts-extra')
conflicts=('wqy-zenhei')
provides=('wqy-zenhei')
replaces=('wqy-zenhei')
source=("http://downloads.sourceforge.net/project/wqy/${_name}/${pkgver}%20%28Fighting-state%20RC1%29/${_name}-${pkgver}.tar.gz"
        40-wqy-zenhei.conf
        43-wqy-zenhei-sharp.conf
        65-wqy-zenhei.conf
        90-tt-wqy-zenhei.conf)
md5sums=('4c6c3f4e902dd5ee0a121e8c41d040bd'
         '36d003e12c7ad99640db7723fe60f44e'
         '8c76b4572df0c41462f16c522580687c'
         '98cbaf37932c24282d2ba0f5222f83b4'
         'ffab9f8da7a9ab723395bcd6efde376f')

build() {
  cd "${_name}"

  grep README -e "GPL v2 license with font embedding exception" -A 12 >| FONTEXCEPTION
}

package() {
  cd "${_name}"

  install -D -m644 FONTEXCEPTION \
    "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING

  install -D -m644 "${_name}.ttc" "${pkgdir}/usr/share/fonts/${pkgname}/${_name}.ttc"

  cd "${srcdir}"
  install -D -m644 40-wqy-zenhei.conf \
    "${pkgdir}"/etc/fonts/conf.avail/40-wqy-zenhei.conf
  install -D -m644 43-wqy-zenhei-sharp.conf \
    "${pkgdir}"/etc/fonts/conf.avail/43-wqy-zenhei.conf
  install -D -m644 65-wqy-zenhei.conf \
    "${pkgdir}"/etc/fonts/conf.avail/65-wqy-zenhei.conf
  install -D -m644 90-tt-wqy-zenhei.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-wqy-zenhei.conf

  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/40-wqy-zenhei.conf .
  ln -s ../conf.avail/90-tt-wqy-zenhei.conf .
}
