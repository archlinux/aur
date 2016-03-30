#PKGBUILD Maintainer: Rafael Reggiani Manzo <rr.manzo#gmail.com>

pkgname=codeclimate
pkgver=0.24.0
pkgrel=1
pkgdesc="Command line interface for the Code Climate analysis platform. It allows you to run Code Climate engines on your local machine inside of Docker containers. Make sure that your current user belongs to docker group and that docker is running."
groups=('codeclimate')
arch=('any')
url="https://github.com/codeclimate/codeclimate"
license=('MIT')
depends=('docker')
makedepends=()
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('a29c5c7e0d1d9b0cf1e0fd505648fccf08600ef24ab632203f0460ec898af8de8b5b656ea542b28b842bfd5942d1e5433ad88c29ae8e3fa6d171fc475b4ac8c5')

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
