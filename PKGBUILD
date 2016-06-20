#PKGBUILD Maintainer: Rafael Reggiani Manzo <rr.manzo#gmail.com>

pkgname=codeclimate
pkgver=0.34.1
pkgrel=1
pkgdesc="Command line interface for the Code Climate analysis platform. It allows you to run Code Climate engines on your local machine inside of Docker containers. Make sure that your current user belongs to docker group and that docker is running."
groups=('codeclimate')
arch=('any')
url="https://github.com/codeclimate/codeclimate"
license=('MIT')
depends=('docker')
makedepends=()
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('afb28f713cc81c7b8af1ceb6fb298098389df7b4cd865ccfbacc7dbe9f5f9d612ce9d7b230fa591424021614e154b2ac8b02a345170968516dd07824a5f98459')

prepare(){
  if ! groups ${USER} | grep &>/dev/null '\bdocker\b'; then
    >&2 echo "The user ${USER} does not belong to the docker group. Please add it."
    exit 1
  fi

  if ! systemctl is-active docker | grep &>/dev/null '\bactive\b'; then
    >&2 echo "Docker service is not started. Please start it."
    exit 1
  fi
}

package(){
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}
