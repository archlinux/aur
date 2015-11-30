#PKGBUILD Maintainer: Rafael Reggiani Manzo <rr.manzo#gmail.com>

pkgname=codeclimate
pkgver=0.14.5
pkgrel=1
pkgdesc="Command line interface for the Code Climate analysis platform. It allows you to run Code Climate engines on your local machine inside of Docker containers. Make sure that your current user belongs to docker group and that docker is running."
groups=('codeclimate')
arch=('any')
url="https://github.com/codeclimate/codeclimate"
license=('MIT')
depends=('docker')
makedepends=()
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('002140fd6376ad7379e9ae37ab1ff78fd089e576d5c69df0ce74e957ce131e7ded854afe1cd6c3ac5c28aaf11b580731ca6d9a14539b9069c81a745a5b3b90f0')

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
