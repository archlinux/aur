# Maintainer: Cassio Almeida <jcassiocosta@gmail.com>
# Maintainer: Claudio Netto <nettinhorama@gmail.com>

pkgname=tsuru
pkgver=1.7.3
pkgrel=1
arch=('any')

pkgdesc='Command-line tool for application developers managing apps, services or workloads through Tsuru.'
url='https://github.com/tsuru/tsuru-client'
license=('BSD')

makedepends=('go')
provides=("tsuru=${pkgver}")

source=("tsuru-client.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('9e8adceba8d4f65df120f27be474cb4602e757920a5cc1c6bc4ddaa09d58ec02')

build() {
  make -C ${srcdir}/tsuru-client-${pkgver} build
}

package(){
  cd "${srcdir}/tsuru-client-${pkgver}"

  install -Dpm755 ./bin/tsuru -t ${pkgdir}/usr/bin

  install -Dpm644 ./misc/bash-completion -t ${pkgdir}/usr/share/bash-completion/completions/tsuru
  install -Dpm644 ./misc/zsh-completion -t ${pkgdir}/usr/share/zsh/site-functions/_tsuru
}
