# Maintainer: Cassio Almeida <jcassiocosta@gmail.com>
# Maintainer: Claudio Netto <nettinhorama@gmail.com>

pkgname=tsuru
pkgver=1.9.6
pkgrel=1
arch=('any')

pkgdesc='Command-line tool for application developers managing apps, services or workloads through Tsuru.'
url='https://github.com/tsuru/tsuru-client'
license=('BSD')

makedepends=('go')
provides=("tsuru=${pkgver}")

source=("tsuru-client.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('7a93003cc661fe231e49d3e38e0eaf0603b2ed4ddfd3c4314c9e185502085396')

build() {
  make -C ${srcdir}/tsuru-client-${pkgver} build
}

package(){
  cd "${srcdir}/tsuru-client-${pkgver}"

  install -Dpm755 ./bin/tsuru -t ${pkgdir}/usr/bin

  install -Dpm644 ./misc/bash-completion -t ${pkgdir}/usr/share/bash-completion/completions/tsuru
  install -Dpm644 ./misc/zsh-completion -t ${pkgdir}/usr/share/zsh/site-functions/_tsuru
}
