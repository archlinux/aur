# Maintainer: Morris Jobke <hey AT morrisjobke.de>
# Maintainer: Martin Mlynář <nexus+arch@smoula.net>
pkgname=dokku
pkgver=0.6.4
pkgrel=1
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
	'sshcommand'='0.4.0'
	'herokuish'
	'openbsd-netcat'
	'gliderlabs-sigil'
	'lsb-release'
	'bind-tools'
	'python'
)

source=(
  "https://github.com/dokku/dokku/archive/v${pkgver}.zip"
  "${pkgname}.install"
)
sha256sums=('4514fa85e11c48fa918780657460ffe4e6ab797178225d9c000c4b7edeb49971'
            '99a9d421fe100ef889f0f23be409289c8e627e55e6d5231c79a50d5da290eeb7')
install=${pkgname}.install

package() {
  cd "${srcdir}/"

  cd "$pkgname-$pkgver"

  install -Dm755 dokku "${pkgdir}/usr/bin/dokku"

  mkdir -p "${pkgdir}/var/lib/dokku/core-plugins/available"
  cp -r plugins/* "${pkgdir}/var/lib/dokku/core-plugins/available"
  find plugins/ -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | while read plugin; do touch "${pkgdir}/var/lib/dokku/core-plugins/available/${plugin}/.core"; done

}
