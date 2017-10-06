# Maintainer: Joakim Nylén <me@jnylen.nu>

pkgname=mailspring
pkgver=1.0.1
pkgrel=4
pkgdesc="A beautiful, fast and maintained fork of Nylas Mail by one of the original authors."
arch=('x86_64')
license=('GPL3')
url="https://getmailspring.com/"
options=('!strip' '!upx')

source=()
sha256sums=()
sha256sums_x86_64=('3d1796268d6169d24427f00dce229305943d516bbe060dc4cdef4db615f4f380')

source_x86_64=("https://mailspring-builds.s3.amazonaws.com/client/ba1d6734/linux/mailspring-${pkgver}-amd64.deb")
depends=("libsasl>=2.0.0" "libgnome-keyring" "libtool" "c-ares" "ctemplate" "icu" "libxext" "openssl" "tidy" "libxtst" "libxkbfile" "glib2" "libxml2" "libutil-linux")

package() {
	cd ${srcdir}

	tar -xvf data.tar.xz -C ${pkgdir} --exclude='./control'

  # mailspring calls libsasl2.so.2 for some reason when arch have .3
  if [[ ! -f "/usr/lib/libsasl2.so.2" && -f /usr/lib/libsasl2.so.3 ]]
  then
    ln -s /usr/lib/libsasl2.so.3 /usr/lib/libsasl2.so.2
  fi

	chmod -R go-w "${pkgdir}"/usr
}
