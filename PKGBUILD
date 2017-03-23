# Maintainer: David P. <megver83@openmailbox.org>
# Contributor: artoo <artoo@manjaro.org>

_url="https://raw.githubusercontent.com/gentoo/gentoo/master"

_sed_args=(-e 's|/var/run|/run|g' -e 's|/usr/sbin|/usr/bin|g')
_prefix=true

$_prefix && _sed_args+=(-e 's|#!/sbin/openrc-run|#!/usr/bin/openrc-run|g')

pkgbase=openrc-desktop
pkgname=('acpid-openrc'
		'alsa-utils-openrc'
		'avahi-openrc'
		'displaymanager-openrc'
		'gpm-openrc'
		'bluez-openrc'
		'networkmanager-openrc'
		'wpa_supplicant-openrc'
		'elogind-openrc')

pkgver=20170320
pkgrel=1.aur1
pkgdesc="OpenRC init scripts"
arch=('any')
url="https://github.com/manjaro/packages-openrc"
license=('GPL2')
# groups=('openrc-desktop')
conflicts=('systemd-sysvcompat')
source=("acpid.confd::${_url}/sys-power/acpid/files/acpid-2.0.16-conf.d"
        "acpid.initd::${_url}/sys-power/acpid/files/acpid-2.0.26-init.d"
        "alsasound.confd::${_url}/media-sound/alsa-utils/files/alsasound.confd-r4"
        "alsasound.initd::${_url}/media-sound/alsa-utils/files/alsasound.initd-r6"
        "xdm.confd::${_url}/x11-base/xorg-server/files/xdm.confd-4"
        "xdm.initd::${_url}/x11-base/xorg-server/files/xdm.initd-11"
        "xdm-setup.initd::${_url}/x11-base/xorg-server/files/xdm-setup.initd-1"
        "${_url}/x11-apps/xinit/files/startDM.sh"
        "gpm.confd::${_url}/sys-libs/gpm/files/gpm.conf.d"
        "gpm.initd::${_url}/sys-libs/gpm/files/gpm.rc6-2"
        "rfcomm.initd::${_url}/net-wireless/bluez/files/rfcomm-init.d-r2"
        "bluetooth.initd::${_url}/net-wireless/bluez/files/bluetooth-init.d-r3"
        "wpa_supplicant.confd::${_url}/net-wireless/wpa_supplicant/files/wpa_supplicant-conf.d"
        "wpa_supplicant.initd::${_url}/net-wireless/wpa_supplicant/files/wpa_supplicant-init.d"
        "${_url}/net-wireless/wpa_supplicant/files/wpa_cli.sh"
        "NetworkManager.confd::${_url}/net-misc/networkmanager/files/conf.d.NetworkManager"
        "NetworkManager.initd::${_url}/net-misc/networkmanager/files/init.d.NetworkManager-r1"
        "elogind.confd::${_url}/sys-auth/elogind/files/elogind.conf"
        "elogind.initd::${_url}/sys-auth/elogind/files/elogind.init"
        '10-openrc-status'
        'avahi-daemon.initd'
        'avahi-dnsconfd.initd')
sha256sums=('3755d4eb8bb64a1304e5defedb949305ac550565da36fe4f94d5f31beee821ba'
            '5dcf5721a129b3782c13fc453853c390c34e2ad4ee00706388ce014454b063ee'
            'd1c55400b701a72dcb8bb85e016b5013fa3eb6a2766ffc20dae278d0ee4c1a43'
            'cf67ba1c4bd13cc6fafdebab40b3e84d09f5b6ec768ed2dcf0ec53d9be296ba4'
            '9d26b72bb28611a60a6b9f942b8d8cfe47b59f926be89af9709b5912668344d8'
            '2ae57ee506eeb15eaa8f06b6a8f1d29fd007e33558c506bbf7640d16c4a67d50'
            'e37a9353ed848f35ac7b07d1398466a18741fd1de075a6cb971e1c28088d791d'
            'f343f87c5c89aa1b7112ec946c4df06b25e541d488405f4d98bedbeddd30bd32'
            '73e7483fdc4b12ab4225a4cb13bbe7da71b07b9e69b17e3a6a4c63cb5e2287c8'
            'b48fd8ef0c4e64ca3f3ada72e8e2148a276f86bf3cbb1a165504058bd15385c1'
            '0bd7f4a3e05c781f4cd24ef7d6702fbd7e621100bcd1e281f0ee15bb134f96b5'
            'e42a9bef5fb34bfcbab223189a416e7be220009aaef36d26b39c664655b2971c'
            '61ec59007f66ac5bacc0aa095d1f2ccbc977a687038e161a463d1727223d5a90'
            '98985142371d39ea6294d757e85a3d3fc9fc21718063afbf81869e1d2ca648a7'
            'f3aa34b99a90213c53496f8ea014c487266338791f3526043a7fd97adc651fc6'
            '4594573f01fe5e04b6dde4525796acf909158591bdcefd662ec23fe0d1c3e1bd'
            '99bd8af8573b8b4ca64e818ef312ce6094f05ed5829712203fd4a12b98f39650'
            'ad651e0c6cd456cc0209802ac878a7c08e69435f0428ded4ad116d11f728b2dd'
            '0113e93f3dd2c7e2ee581a39e7625d49d8e64c6089d432721a6be9df85e36531'
            '1535237db113a76261d6f1ce0b24a55e956934b0c1c59e9fd624f621961327b6'
            '876788303553fe773e64917f76f0208f5e8adf7b91d4af24aa9d6a68a147d646'
            'e128576d72981e402ff106bb481108ab6d5ba941ab1b0f5f53e96a7831fc1d15')

pkgver() {
	date +%Y%m%d
}

_inst_initd(){
    install -Dm755 ${srcdir}/$1.initd ${pkgdir}/etc/init.d/$1
    
    sed ${_sed_args[@]} -i ${pkgdir}/etc/init.d/$1
}

_inst_confd(){
    install -Dm755 ${srcdir}/$1.confd ${pkgdir}/etc/conf.d/$1
}

package_acpid-openrc() {
    pkgdesc="OpenRC acpid init script"
    groups=('openrc-desktop')
    depends=('openrc' 'acpid')
    backup=('etc/conf.d/acpid')

    _inst_confd 'acpid'
    _inst_initd 'acpid'
}

package_alsa-utils-openrc() {
    pkgdesc="OpenRC alsa-utils init script"
    groups=('openrc-desktop')
    depends=('openrc' 'alsa-utils')
    backup=('etc/conf.d/alsasound')

    _inst_confd 'alsasound'
    _inst_initd 'alsasound'
}

package_avahi-openrc() {
    pkgdesc="OpenRC avahi init script"
    groups=('openrc-desktop')
    depends=('avahi' 'dbus-openrc')

    _inst_initd 'avahi-daemon'
    _inst_initd 'avahi-dnsconfd'
}

package_displaymanager-openrc() {
    pkgdesc="OpenRC dm init script"
    groups=('openrc-desktop')
    depends=('xorg-server' 'xorg-xinit' 'udev-openrc')
    optdepends=('elogind-openrc: elogind initscript'
                'dbus-openrc: dbus initscript')

    backup=('etc/conf.d/xdm')
    install=displaymanager.install

    _inst_confd 'xdm'
    _inst_initd 'xdm'
    _inst_initd 'xdm-setup'

    install -Dm755 "${srcdir}/startDM.sh" "${pkgdir}/etc/X11/startDM.sh"

    sed -e 's|/etc/profile.env|/etc/profile|g' \
        -e 's|{ROOTPATH}|{PATH}|g' \
        -e 's|use consolekit dbus xfs|use consolekit dbus xfs elogind|' \
        -i "${pkgdir}/etc/init.d/xdm"
}

package_elogind-openrc() {
    pkgdesc="OpenRC elogind init script"
    groups=('openrc-desktop')
    depends=('elogind' 'dbus-openrc' 'udev-openrc')
    conflicts=('consolekit-openrc')
# 	replaces=('consolekit-openrc')

    _inst_confd 'elogind'
    _inst_initd 'elogind'

    sed -e 's|/usr/libexec|/usr/lib|' \
        -e 's|/var/run|/run|' \
        -i "${pkgdir}/etc/conf.d/elogind"
}

package_gpm-openrc() {
    pkgdesc="OpenRC gpm init script"
    depends=('openrc' 'gpm')
    groups=('openrc-desktop')
    backup=('etc/conf.d/gpm')

    _inst_confd 'gpm'
    _inst_initd 'gpm'
}

package_networkmanager-openrc() {
    pkgdesc="OpenRC networkmanager init script"
    depends=('dbus-openrc' 'networkmanager')
    groups=('openrc-desktop' 'openrc-mobile')
    optdepends=('elogind-openrc: elogind initscript')
    backup=('etc/conf.d/NetworkManager')

    _inst_confd 'NetworkManager'
    _inst_initd 'NetworkManager'

    install -Dm755 "${srcdir}/10-openrc-status" "${pkgdir}/etc/NetworkManager/dispatcher.d/10-openrc-status"

    sed -e 's|use consolekit|use consolekit elogind|' \
        -i "${pkgdir}/etc/init.d/NetworkManager"
}

package_bluez-openrc() {
    pkgdesc="OpenRC bluez init script"
    groups=('openrc-mobile')
    depends=('bluez' 'dbus-openrc')

    _inst_initd 'rfcomm'
    _inst_initd 'bluetooth'

    sed -e 's|/usr/libexec|/usr/lib|g' \
        -i "${pkgdir}/etc/init.d/bluetooth"
}

package_wpa_supplicant-openrc() {
    pkgdesc="OpenRC wpa_supplicant init script"
    groups=('openrc-mobile')
    depends=('openrc' 'wpa_supplicant')
    backup=('etc/conf.d/wpa_supplicant')

    _inst_confd 'wpa_supplicant'
    _inst_initd 'wpa_supplicant'

    install -Dm755 "${srcdir}/wpa_cli.sh" "${pkgdir}/etc/wpa_supplicant/wpa_cli.sh"

    if [[ -f /etc/os-release ]];then
        . /etc/os-release
        sed -e "s|gentoo-release|${ID}-release|" -i "${pkgdir}/etc/wpa_supplicant/wpa_cli.sh"
    else
        sed -e 's|gentoo-release|arch-release|' -i "${pkgdir}/etc/wpa_supplicant/wpa_cli.sh"
    fi
}
