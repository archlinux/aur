#PKGBUILD Maintainer: Rafael Reggiani Manzo <rr.manzo#gmail.com>

pkgname=codeclimate
pkgver=0.20.0
pkgrel=1
pkgdesc="Command line interface for the Code Climate analysis platform. It allows you to run Code Climate engines on your local machine inside of Docker containers. Make sure that your current user belongs to docker group and that docker is running."
groups=('codeclimate')
arch=('any')
url="https://github.com/codeclimate/codeclimate"
license=('MIT')
depends=('docker')
makedepends=()
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('a8672867373a24a3b790af9a89944fafd12fab87a620d11d4400b7403c3316a9de248473e241e8229eda124204b046173cd896ed9cb834e857fa806146be6164')

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
