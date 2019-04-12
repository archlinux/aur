# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgname=systemd_mon
pkgver=0.1.0
pkgrel=1
pkgdesc='Monitor systemd units and trigger alerts for failed states.'
arch=('any')
url='https://github.com/joonty/systemd_mon'
license=('MIT')
depends=('ruby-dbus')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${pkgname}-${pkgver}.gem"
        "${pkgname}.service"
        "sample-config.yml")
sha256sums=('1d1e981ffb2ad10c6542eb580b758ebf0d1fb4bd2a3921ea0614e61c695b386c'
            'c23f5a4fb346e4294e5764ae8544b3f00fe40c5f8adbba0ffc5accfb3e5171b6'
            '402b42e7b76385137541cdf397b32886116c6a975568556c87de7dd25fe670ed')
noextract=("${pkgname}-${pkgver}.gem")

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${pkgname}-${pkgver}.gem"
	rm "${pkgdir}/${_gemdir}/cache/${pkgname}-${pkgver}.gem"

	install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	install -Dm644 "sample-config.yml" "${pkgdir}/etc/${pkgname}/sample-config.yml"
}
