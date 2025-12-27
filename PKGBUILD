# shellcheck shell=bash
# shellcheck disable=SC2034  # Various variables that are used by makepkg
# shellcheck disable=SC2154  # Various variables that are provided by makepkg
# Maintainer: eomanis at web dot de

pkgname='coturn-babysitter'
_pkgverUpstream="0.0.2"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=1
pkgdesc="coturn configuration rewriter and service reloader"
arch=('any')
url='https://www.eomanis.dedyn.io/permshare/coturn-babysitter/'
license=('GPL-3.0-only')
depends=('python>=3.13' 'python-dnspython')
source=("https://www.eomanis.dedyn.io/permshare/coturn-babysitter/coturn-babysitter-${_pkgverUpstream}.tar.gz")
sha384sums=('4325dcdfb440909518b0c9a0fb7ec1fc7f1ad25fc0c99291d73336a8a2c8b71ea7de3189c3e1ae8bc89c02a6cf917c6e')

package () {
    local srcRootDir="${srcdir}/${pkgname}-${_pkgverUpstream}"

	# Create a bunch of directories
	install --mode=u=rwx,go=rx --directory \
		"${pkgdir}/usr/bin" \
		"${pkgdir}/etc/coturn-babysitter" \
		"${pkgdir}/usr/lib/systemd/system" \
		"${pkgdir}/usr/lib/systemd/system/coturn-babysitter.d"

	# Place some files
	install --mode=u=rwx,go=rx --target-directory="${pkgdir}/usr/bin" -- \
		"${srcRootDir}/coturn-babysitter"
	install --mode=u=rw,go=r --target-directory="${pkgdir}/etc/coturn-babysitter" -- \
		"${srcRootDir}/turnserver.conf.template.example"
	install --mode=u=rw,go=r --target-directory="${pkgdir}/usr/lib/systemd/system" -- \
		"${srcRootDir}/systemd/coturn-babysitter.service" \
		"${srcRootDir}/systemd/coturn-babysitter.timer"
	install --mode=u=rw,go=r --target-directory="${pkgdir}/usr/lib/systemd/system/coturn-babysitter.d" -- \
	    "${srcRootDir}/systemd/custom.conf.example"
}
