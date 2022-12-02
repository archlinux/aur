# Maintainer Rojikku <RojikkuNoKami at gmail dot com>
# Contributor: GI_Jack <GI_Jack@hackermail.com>

pkgname=dangerzone
pkgver=0.4.0
pkgrel=1
pkgdesc="Take potentially dangerous PDFs, office documents, or images and convert them to a safe PDF"
url="https://dangerzone.rocks/"
arch=('x86_64')
license=('MIT')
depends=('python-appdirs' 'python-click' 'python-pyxdg' 'python-requests' 'pyside2' 'python-termcolor' 'python-pip' 'podman')
makedepends=('python-setuptools') # 'buildah')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/firstlookmedia/dangerzone/archive/v${pkgver}.tar.gz)
sha256sums=('4f2c7382726f8a87a0cc52d2e9a3bb2119067efe589c15d2f66444a5e3058d91')

package() {
  cd ${pkgname}-${pkgver}
  # Poetry Setup
  python -m venv dangerzone
  source ./dangerzone/bin/activate
  python -m pip install poetry
  poetry install

  #Docker image setup
  #echo "Building container image"
  # buildah build --userns auto --isolation rootless --platform linux/amd64 --tag dangerzone.rocks/dangerzone --output type=tar,dest=share/countainer.tar container

  #echo "Compressing container image"
  #gzip -f share/container.tar

  #echo "Looking up the image id"
  #podman image ls dangerzone.rocks/dangerzone | grep "dangerzone.rocks/dangerzone" | tr -s ' ' | cut -d' ' -f3 > share/image-id.txt

  #Install
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
