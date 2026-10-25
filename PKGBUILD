# Maintainer: Alexei Colin <ac at alexeicolin dot com>
# Contributor: Maxim Baz <archlinux at maximbaz dot com>

# ID copied from extension installed via Firefox add-on repository
# ATTN: Keep this variable in sync with .install file
_id=parcel@erayd.net
_name="parcel_pm"

pkgname=parcel-firefox
pkgver=1.0.7
pkgrel=1
pkgdesc="Firefox browser extension for zx2c4's pass password manager"
arch=('any')
url="https://github.com/parcel-pm/parcel"
license=('ISC')
depends=("parcel>=${pkgver}")
makedepends=()
optdepends=("pass: password manager to manage the password store"
            "libarchive: inspect bundled host script with bsdtar")
# Can't build the extension from source, because needs to be signed by Mozilla.
source=("https://addons.mozilla.org/firefox/downloads/file/5024332/${_name}-${pkgver}.xpi")
sha256sums=('2508163e087443ff99c1c24a998dc507f806f02b83ebd750403db3c7f1e1d2e1')
validpgpkeys=('82ED663067C6017BAA4BC752EB670BF2B1131683'
              'B0908ED59A96C9882BED9A942A51761511A30253'
              '88FF14D6294AF4036B7F00FF676A3C09E2E47A72'
              '56C3E775E72B0C8B1C0C1BD0B5DB77409B11B601')
install="${pkgname}.install"

package() {
    install -Dm644 "${_name}-${pkgver}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/${_id}.xpi"

    # Link to json manifest file installed by parcel package
    local _nmh_dir="/usr/lib/mozilla/native-messaging-hosts"
    install -dm755 "${pkgdir}${_nmh_dir}"
    ln -sf "/usr/lib/parcel/hosts/firefox/com.github.erayd.parcel.json" "${pkgdir}${_nmh_dir}"
}

# vim:set ts=4 sw=4 et:
