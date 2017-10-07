# Maintainer: Joakim Nylén <me@jnylen.nu>
# Contributor: ahrs

pkgname=mailspring
pkgver=1.0.2
pkgrel=1
pkghash=4eab3f85
pkgdesc="A beautiful, fast and maintained fork of Nylas Mail by one of the original authors."
arch=('x86_64')
license=('GPL3')
url="https://getmailspring.com/"
options=('!strip' '!upx')

source=()
sha256sums=()
sha256sums_x86_64=('dcdc6c67006ee148e1db943dd6cd20e41a4846798071b5ab08b59c24637d97ef')

source_x86_64=("https://mailspring-builds.s3.amazonaws.com/client/${pkghash}/linux/mailspring-${pkgver}-amd64.deb")
depends=("libsasl>=2.0.0" "libgnome-keyring" "libtool" "c-ares" "ctemplate" "icu" "libxext" "openssl" "tidy" "libxtst" "libxkbfile" "glib2" "libxml2" "libutil-linux")

package() {
	cd ${srcdir}

	tar -xvf data.tar.xz -C ${pkgdir} --exclude='./control'

  # mailspring calls libsasl2.so.2 for some reason when arch have .3
  if [[ ! -f "/usr/lib/libsasl2.so.2" && -f /usr/lib/libsasl2.so.3 ]]
  then
    install -dm755 ${pkgdir}/usr/lib
    ln -s /usr/lib/libsasl2.so.3 ${pkgdir}/usr/lib/libsasl2.so.2
  fi

	chmod -R go-w "${pkgdir}"/usr
}
