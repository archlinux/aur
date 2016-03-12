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
)

source=(
#  "https://github.com/dokku/dokku/archive/v${pkgver}.zip"
  "https://github.com/MorrisJobke/dokku/archive/v0.4.14-arch-linux.zip"
  "${pkgname}.install"
)
sha256sums=('41894fc85399c6cf6d03e6cb15c2291dfc7fb83cfafd15fddcf28754effd0444'
            'e173147ecb9887a0d558a7d624d0500f1242b91b70e86e35ada39c73fd80a29b')
install=${pkgname}.install

package() {
  cd "${srcdir}/"

  #cd "$pkgname"
  cd "dokku-0.4.14-arch-linux"

  install -Dm755 dokku "${pkgdir}/usr/bin/dokku"

  cp -r plugins/* "${pkgdir}/var/lib/dokku/core-plugins/available"
  find plugins/ -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | while read plugin; do touch "${pkgdir}/var/lib/dokku/core-plugins/available/$$plugin/.core"; done

}
