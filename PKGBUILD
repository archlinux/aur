#PKGBUILD Maintainer: Rafael Reggiani Manzo <rr.manzo#gmail.com>

pkgname=codeclimate
pkgver=0.0.7
pkgrel=1
pkgdesc="Command line interface for the Code Climate analysis platform. It allows you to run Code Climate engines on your local machine inside of Docker containers. Make sure that your current user belongs to docker group and that docker is running."
groups=('codeclimate')
arch=('any')
url="https://github.com/codeclimate/codeclimate"
license=('MIT')
depends=('docker')
makedepends=()
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('6c61221102233595f6fdb2e9e642a0dc475a0c03834a9397820f08fa3ffaf7ad74c676924dbe6304493ae6828222f35edd8f6479f3ade8d6aa53edbae12fd071')

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