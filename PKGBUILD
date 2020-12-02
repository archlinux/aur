# Maintainer: vinibali <vinibali1 at gmail dot com>

pkgname=lglaf
pkgver=20180317
pkgrel=5
pkgdesc="LGLAF.py is a utility for communication with LG devices in Download Mode. This allows you to execute arbitrary shell commands on a LG phone as root. Utility was created by Lekensteyn (Peter Wu)"
arch=(i686 x86_64)
url="https://gitlab.com/vinibali/lglaf"
license=('MIT')
depends=('python' 'python-pyusb')
source=(https://gitlab.com/vinibali/lglaf/-/archive/"${pkgver}"/"${pkgname}"-"${pkgver}".zip)
md5sums=(524a210dc65cbf5cd2da3fd8217030bc)

package() {

	install -Dm755 "${srcdir}"/"${pkgname}"-"${pkgver}"/dump-file.py "${pkgdir}"/opt/lglaf/dump-file.py
	install -Dm755 "${srcdir}"/"${pkgname}"-"${pkgver}"/extract-partitions.py "${pkgdir}"/opt/lglaf/extract-partitions.py
	install -Dm755 "${srcdir}"/"${pkgname}"-"${pkgver}"/gpt.py "${pkgdir}"/opt/lglaf/gpt.py
	install -Dm755 "${srcdir}"/"${pkgname}"-"${pkgver}"/laf_crypto.py "${pkgdir}"/opt/lglaf/laf_crypto.py
	install -Dm755 "${srcdir}"/"${pkgname}"-"${pkgver}"/lglaf.py "${pkgdir}"/opt/lglaf/lglaf.py
	install -Dm755 "${srcdir}"/"${pkgname}"-"${pkgver}"/partitions.py "${pkgdir}"/opt/lglaf/partitions.py
	install -Dm755 "${srcdir}"/"${pkgname}"-"${pkgver}"/README.md "${pkgdir}"/opt/lglaf/README.md
  install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	mkdir -p "${pkgdir}"/etc/udev/rules.d/
	install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/rules.d/42-usb-lglaf.rules "${pkgdir}"/etc/udev/rules.d/
	mkdir -p "${pkgdir}"/usr/bin/
	echo -e '#!/bin/bash\ncd /opt/lglaf\npython2.7 /opt/lglaf/lglaf.py' > "${pkgdir}"/usr/bin/lglaf
	chmod +x "${pkgdir}"/usr/bin/lglaf
}
