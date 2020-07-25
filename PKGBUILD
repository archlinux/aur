# Maintainer: vinibali <vinibali1 at gmail dot com>

pkgname=lglaf
pkgver=20180317
pkgrel=3
pkgdesc="LGLAF.py is a utility for communication with LG devices in Download Mode. This allows you to execute arbitrary shell commands on a LG phone as root. Utility was created by Lekensteyn (Peter Wu)"
arch=(i686 x86_64)
url="https://gitlab.com/vinibali/lglaf"
license=('MIT')
depends=('python' 'python-pyusb')
source=(https://gitlab.com/vinibali/lglaf/-/archive/20180317/lglaf-20180317.zip)
md5sums=(524a210dc65cbf5cd2da3fd8217030bc)

build() {
	echo "No build needed"
}

package() {

	install -Dm755 "${srcdir}"/lglaf-20180317/dump-file.py "${pkgdir}"/opt/lglaf/dump-file.py
	install -Dm755 "${srcdir}"/lglaf-20180317/extract-partitions.py "${pkgdir}"/opt/lglaf/extract-partitions.py
	install -Dm755 "${srcdir}"/lglaf-20180317/gpt.py "${pkgdir}"/opt/lglaf/gpt.py
	install -Dm755 "${srcdir}"/lglaf-20180317/laf_crypto.py "${pkgdir}"/opt/lglaf/laf_crypto.py
	install -Dm755 "${srcdir}"/lglaf-20180317/lglaf.py "${pkgdir}"/opt/lglaf/lglaf.py
	install -Dm755 "${srcdir}"/lglaf-20180317/partitions.py "${pkgdir}"/opt/lglaf/partitions.py
	install -Dm755 "${srcdir}"/lglaf-20180317/README.md "${pkgdir}"/opt/lglaf/README.md
	mkdir -p "${pkgdir}"/etc/udev/rules.d/
	install -Dm644 "${srcdir}"/lglaf-20180317/rules.d/42-usb-lglaf.rules "${pkgdir}"/etc/udev/rules.d/
	mkdir -p "${pkgdir}"/usr/bin/
	echo -e '#!/bin/bash\ncd /opt/lglaf\npython2.7 /opt/lglaf/lglaf.py' > "${pkgdir}"/usr/bin/lglaf
	chmod +x "${pkgdir}"/usr/bin/lglaf
}
