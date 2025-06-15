# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname='firefox-user-agent-switcher-and-manager-bin'
pkgver=0.6.5.1
pkgrel=1
pkgdesc='Spoof websites trying to gather information about your web navigation—like your browser type and operating system—to deliver distinct content you may not want.'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/user-agent-string-switcher/'
license=('MPL-2.0')
depends=('firefox')
_source_file_id=4497925
source=('user_agent_string_switcher.xpi'::"https://addons.mozilla.org/firefox/downloads/file/${_source_file_id}/user_agent_string_switcher-${pkgver}.xpi")
noextract=('user_agent_string_switcher.xpi')
sha256sums=('aaaf7cfc3434b42836fd0c152a218dbf5e405f65095a8d8f431578461a34c171')
makedepends=('unzip')

prepare() {
  cd "$srcdir"
  unzip -qqo "user_agent_string_switcher.xpi" -d "user_agent_string_switcher-${pkgver}"
}

package() {
  _extension_id="$(sed -n 's/.*"id": "\(.*\)".*/\1/p' user_agent_string_switcher-${pkgver}/manifest.json)"
  install -Dm644 'user_agent_string_switcher.xpi' "${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}.xpi"
}
