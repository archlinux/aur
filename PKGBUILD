# Maintainer: Cassio Almeida <jcassiocosta@gmail.com>
# Maintainer: Claudio Netto <nettinhorama@gmail.com>

pkgname=tsuru
pkgver=1.8.1
pkgrel=1
arch=('any')

pkgdesc='Command-line tool for application developers managing apps, services or workloads through Tsuru.'
url='https://github.com/tsuru/tsuru-client'
license=('BSD')

makedepends=('go')
provides=("tsuru=${pkgver}")

source=("tsuru-client.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('ccd9b6cb113e97da5203940385c8c1cb3833cb243467e9b8453d90bb49a19a0d')

build() {
  make -C ${srcdir}/tsuru-client-${pkgver} build
}

package(){
  cd "${srcdir}/tsuru-client-${pkgver}"

  install -Dpm755 ./bin/tsuru -t ${pkgdir}/usr/bin

  install -Dpm644 ./misc/bash-completion -t ${pkgdir}/usr/share/bash-completion/completions/tsuru
  install -Dpm644 ./misc/zsh-completion -t ${pkgdir}/usr/share/zsh/site-functions/_tsuru
}
