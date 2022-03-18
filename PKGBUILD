# Maintainer: skrewball <skrewball at joickle dot com>

pkgname=gnome-shell-extension-color-picker
pkgver=27
pkgrel=3
pkgdesc='Simple color picker for gnome shell'
arch=(any)
url='https://github.com/tuberry/color-picker'
license=('GPL3')
depends=('dconf' 'gnome-shell>=41')
source=("https://extensions.gnome.org/extension-data/color-pickertuberry.v${pkgver}.shell-extension.zip"
	"https://raw.githubusercontent.com/tuberry/color-picker/master/color-picker%40tuberry/schemas/org.gnome.shell.extensions.color-picker.gschema.xml")
sha256sums=('c8b7e269f214ce97b81930cdd9ca34b28d8d7f8736b69d5ea76d6f3f9dd73de9'
            '0adb1688bd9e0cb9721995eb9b004e622997afcefaf12d33c307a85bf39d5540')

package() {
    local _uuid="color-picker@tuberry"
    local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
    
    install -Dm644 -t "${_destdir}" metadata.json *.js *.css
    install -Dm644 -t "${_destdir}/icons" icons/*.svg
    install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" org.gnome.shell.extensions.color-picker.gschema.xml
    
    cd locale
    for locale in */
      do
        install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
      done
}
