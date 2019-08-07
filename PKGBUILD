# Maintainer: svalo <code@valo.space>
pkgname="certbot-dns-gandi-git"
pkgdesc="gandi DNS authenticator plugin for certbot - GIT version"
pkgver=20190716.9bc7d07
pkgrel=1
arch=("any")
url="https://github.com/obynio/certbot-plugin-gandi.git"
license=("MIT")
depends=("certbot")
makedepends=("python-setuptools")
provides=("certbot-dns-gandi")
backup=(
  "etc/letsencrypt/gandi.ini"
)
source=(
  "certbot-dns-gandi::git://github.com/obynio/certbot-plugin-gandi.git"
  "gandi.ini"
)
sha256sums=('SKIP'
            '2a55fa5f82814eb95d9748737be182302d3a8cb2217e0365737062a8f57a677c')

pkgver() {
  cd "${srcdir}/certbot-dns-gandi"
  git log -1 --date=short --format="%cd.%h" | tr -d '-'
}

package() {
  cd "${srcdir}/certbot-dns-gandi"
  python setup.py install --root="${pkgdir}"
  mkdir -p "${pkgdir}/etc/letsencrypt"
  install -m 0600 "${srcdir}/gandi.ini" "${pkgdir}/etc/letsencrypt/gandi.ini"
}
