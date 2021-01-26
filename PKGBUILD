# Maintainer: robertfoster

pkgname=mopidy-cd-git
pkgver=r35.ddd8736
pkgrel=1
pkgdesc='A Mopidy extension for playing music from Audio CD.'
arch=('any')
url="https://github.com/antosart/mopidy-cd"
license=('APACHE')
depends=('mopidy>=3' 'python-musicbrainzngs')
makedepends=('python-setuptools' 'python-pip')
source=("${pkgname%%-git}::git+${url}"
  mopidy-cd.sysusers)

pkgver() {
  cd "${srcdir}/${pkgname%%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname%%-git}"
  sed -i "s/== 0.6/ >= 0.6/g" setup.py
}

package() {
  cd "${srcdir}/${pkgname%%-git}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 "${srcdir}/mopidy-cd.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/mopidy-cd.conf"
}

sha256sums=('SKIP'
            '040de00da0991afaedd6c6bc7eb938e9ae66d9700865402428a2d073df74face')
