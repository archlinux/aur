# Maintainer: Safing ICS Technologies <noc@safing.io>
#
# Application Firewall: Block Mass Surveillance - Love Freedom
# The Portmaster enables you to protect your data on your device. You
# are back in charge of your outgoing connections: you choose what data
# you share and what data stays private. Read more on docs.safing.io.
#
pkgname=portmaster-stub-bin
pkgver=0.8.8
pkgrel=2
pkgdesc='Application Firewall: Block Mass Surveillance - Love Freedom'
arch=('x86_64')
url='https://safing.io/portmaster'
license=('AGPL3')
depends=('libnetfilter_queue')
makedepends=('imagemagick') # for convert
optdepends=('libappindicator-gtk3: for systray indicator')
options=('!strip')
provides=('portmaster')
conflicts=('portmaster')
install=arch.install
source=("portmaster-start::https://updates.safing.io/linux_amd64/start/portmaster-start_v${pkgver//./-}"
		'portmaster.desktop'
		'portmaster_notifier.desktop'
		'portmaster_logo.png'
		"portmaster.service")
noextract=('portmaster-start')
sha256sums=('36fd91e85d69618cea4a8f4590ceb52893edad601f0231bfdf53ce3f5dddb37e'
         '7b0c03e4552dd86caeff2d628b13346cfe70a646af11abac6555e348e46c28da'
         '490b586f185218fdd947e8f12aa2dc412d78d89c8ce9b8ef5a75cb2e5ffb94ae'
         'ecb02625952594af86d3b53762363c1e227c2b9604fc9c9423682fc87a92a957'
         'bc26dd37e6953af018ad3676ee77570070e075f2b9f5df6fa59d65651a481468')

prepare() {
	for res in 16 32 48 96 128 ; do
		local iconpath="${srcdir}/icons/${res}x${res}/"
		mkdir -p "${iconpath}" ; 
		convert ./portmaster_logo.png -resize "${res}x${res}" "${iconpath}/portmaster.png" ; 
	done
}

package() {
    install -Dm 0755 "${srcdir}/portmaster-start" "${pkgdir}/opt/safing/portmaster/portmaster-start"
    install -Dm 0644 "${srcdir}/portmaster.desktop" "${pkgdir}/opt/safing/portmaster/portmaster.desktop"
    install -Dm 0644 "${srcdir}/portmaster_notifier.desktop" "${pkgdir}/opt/safing/portmaster/portmaster_notifier.desktop"
    install -dm 0755 "${pkgdir}/etc/xdg/autostart"
    ln -s "/opt/safing/portmaster/portmaster_notifier.desktop" "${pkgdir}/etc/xdg/autostart/portmaster_notifier.desktop"
    install -Dm 0644 "${srcdir}/portmaster.service" "${pkgdir}/opt/safing/portmaster/portmaster.service"
    install -Dm 0644 "${srcdir}/icons/32x32/portmaster.png" "${pkgdir}/usr/share/pixmaps/portmaster.png"
    install -Dm 0644 "${srcdir}/icons/16x16/portmaster.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/portmaster.png"
    install -Dm 0644 "${srcdir}/icons/32x32/portmaster.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/portmaster.png"
    install -Dm 0644 "${srcdir}/icons/48x48/portmaster.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/portmaster.png"
    install -Dm 0644 "${srcdir}/icons/96x96/portmaster.png" "${pkgdir}/usr/share/icons/hicolor/96x96/apps/portmaster.png"
    install -Dm 0644 "${srcdir}/icons/128x128/portmaster.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/portmaster.png"
}
