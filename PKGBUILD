pkgname=mailru-cloud
pkgver=15.05.0249
pkgrel=1
pkgdesc="Client for Mail.ru Cloud service"
arch=('x86_64' 'i686')
url="https://cloud.mail.ru/"
license=("custom")
depends=("qt5-base" "qt5-x11extras")
makedepends=("rpmextract")

majver=15.05
minver=0249
fullname=mail.ru-cloud

if [[ ${CARCH} == "i686" ]]; then
	arch='i386'
    source=("https://linuxdesktopcloud.mail.ru/rpm/default/${fullname}-fedora-${minver}-${majver}.${arch}.rpm")
    sha256sums=("3a82b4aed78f095144e1199b6bf45ca70006be417bba89dfa85cb4eae4f23cad")
elif [[ ${CARCH} == "x86_64" ]]; then
	arch=${CARCH}
    source=("https://linuxdesktopcloud.mail.ru/rpm/default/${fullname}-fedora-${minver}-${majver}.${arch}.rpm")
    sha256sums=("01cc21d2c61d2ab53c81dfc609f3b35578c8e9fd601982823566d410666a7fd1")
fi

build() {
	cd "${srcdir}"
	if [[ ${CARCH} == "i686" ]]; then
		arch='i386'
	elif [[ ${CARCH} == "x86_64" ]]; then
		arch=${CARCH}
	fi
	rpmextract.sh ${fullname}-fedora-${minver}-${majver}.${arch}.rpm
}

package() {
	cd "${srcdir}"
	sed -i 's/Internet/Internet;Network/g' usr/share/applications/mail.ru-cloud.desktop
	sed -i 's/=cloud/=mailru-cloud/g' usr/share/applications/mail.ru-cloud.desktop
	cp -r usr "${pkgdir}"
	cd "${pkgdir}"
	mv usr/bin/cloud usr/bin/mailru-cloud
}

