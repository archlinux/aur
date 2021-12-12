# Maintainer: darthdomo <levipinkard@gmail.com>
pkgname=sirfidal-git
_pkgname=sirfidal
_gitname=SiRFIDaL
pkgver=r188.eb51f69
pkgrel=1
pkgdesc="SiRFIDal - Simple RFID authentication for Linux"
arch=('x86_64')
url="https://github.com/Giraut/SiRFIDaL"
license=('GPL3')
depends=('python' 'pam' 'python-psutil' 'python-filelock' 'python-setproctitle' 'pcsclite' 'pcsc-tools' 'python-pyscard' 'python-pyserial' 'android-tools' 'python-evdev' 'tk' 'python-xlib' 'python-cryptography' 'python-pynput' 'sox' 'python-pyufr-git' 'pam-python' 'python-pyperclip')
makedepends=('git')
provides=('sirfidal')
conflicts=()
options=()
source=(git+https://github.com/Giraut/SiRFIDaL.git)
md5sums=('SKIP')

pkgver() {
	cd "${_gitname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir"/"$_gitname"
	mkdir -p "$pkgdir"/usr/local/bin
	mkdir -p "$pkgdir"/usr/share/pam-configs
	mkdir -p "$pkgdir"/etc
	mkdir -p "$pkgdir"/usr/lib/systemd/system
	mkdir -p "$pkgdir"/etc/xdg/autostart
	
	mkdir -p "$pkgdir"/usr/local/share/sounds/sirfidal

	mkdir -p "$pkgdir"/usr/share/licenses/${_pkgname}
	install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	install -Dm 755 sirfidal_server.py "$pkgdir"/usr/local/bin
	install -Dm 755 sirfidal_client_class.py "$pkgdir"/usr/local/bin
	install -Dm 755 sirfidal_autolockscreen.py "$pkgdir"/usr/local/bin
	install -Dm 755 sirfidal_auto_send_enter_at_login.py "$pkgdir"/usr/local/bin
	install -Dm 755 sirfidal_autotype.py "$pkgdir"/usr/local/bin
	install -Dm 755 sirfidal_beep.py "$pkgdir"/usr/local/bin
	install -Dm 755 sirfidal_getuids.py "$pkgdir"/usr/local/bin
	install -Dm 755 sirfidal_keyboard_wedge.py "$pkgdir"/usr/local/bin
	install -Dm 755 sirfidal_pam.py "$pkgdir"/usr/local/bin
	install -Dm 755 sirfidal_useradm.py "$pkgdir"/usr/local/bin

	install -Dm 755 sirfidal_server_parameters.py "$pkgdir"/etc
	install -Dm 755 sirfidal_clients_parameters.py "$pkgdir"/etc
	install -Dm 755 *.service "$pkgdir"/usr/lib/systemd/system
	install -Dm 755 *.desktop "$pkgdir"/etc/xdg/autostart

	install -Dm 755 sounds/* "$pkgdir"/usr/local/share/sounds/sirfidal
}
