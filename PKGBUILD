# Maintainer: Morris Jobke <hey AT morrisjobke.de>
# Maintainer: Martin Mlynář <nexus+arch@smoula.net>
pkgname=dokku
pkgver=0.4.14
pkgrel=4
pkgdesc="Docker powered mini-Heroku in around 100 lines of Bash."
arch=(any)
url="https://github.com/dokku/dokku"
license=(MIT)
makedepends=(
	'plugn'
)
depends=(
	'docker'
	'nginx'
	'plugn'
	'sshcommand'
	'herokuish'
	'openbsd-netcat'
	'gliderlabs-sigil'
	'lsb-release'
	'bind-tools'
	'python'
)

source=(
#  "https://github.com/dokku/dokku/archive/v${pkgver}.zip"
  "https://github.com/MorrisJobke/dokku/archive/v0.4.14-arch-linux.zip"
  "${pkgname}.install"
)
sha256sums=('60c14af9bc7b040a155fe00e71afc9c2dd483611f4a19d237c7feb4bf50f35b6'
            'e173147ecb9887a0d558a7d624d0500f1242b91b70e86e35ada39c73fd80a29b')
install=${pkgname}.install

package() {
  cd "${srcdir}/"

  #cd "$pkgname"
  cd "dokku-0.4.14-arch-linux"

  install -Dm755 dokku "${pkgdir}/usr/bin/dokku"

  mkdir -p "${pkgdir}/var/lib/dokku/core-plugins/available"
  cp -r plugins/* "${pkgdir}/var/lib/dokku/core-plugins/available"
  find plugins/ -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | while read plugin; do touch "${pkgdir}/var/lib/dokku/core-plugins/available/${plugin}/.core"; done

}
