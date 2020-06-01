# Maintainer: Bence Hornák <bence.hornak@gmail.com>

pkgname=dcvviewer-bin
_pkgname=dcvviewer
pkgver=2020.0.1358
pkgrel=1
pkgdesc="DCV Desktop Cloud Visualization GTK client for Linux. DCV is a desktop remotization server, with support for native as well as web-based clients."
arch=('x86_64')
url="https://www.nice-software.com/products/dcv"
license=('custom: commercial')
depends=('backintime' 'cairo>=1.10.0' 'dconf' 'desktop-file-utils' 'ffmpeg' 'gcc-libs>=4.2' 'gdk-pixbuf2>=2.22.0' 'glib2' 'glibc>=2.18' 'gst-plugins-base-libs>=1.0.0' 'gstreamer>=1.0.0' 'gtk3>=3.21.4' 'hicolor-icon-theme' 'krb5>=1.16' 'libepoxy>=1.0' 'libjpeg-turbo' 'libsasl' 'libsoup' 'libva>=1.8.0' 'libx11' 'libxml2>=2.7.4' 'lz4' 'openssl>=1.1.0' 'pango' 'pcsclite>=1.3.0' 'protobuf-c' 'sqlite>=3.5.9')
source=(
  "https://d1uj6qtbmh3dt5.cloudfront.net/2020.0/Clients/nice-dcv-viewer_${pkgver}-1_amd64.ubuntu1804.deb"
)
sha256sums=('b41820f54a8e3e5e820cc32aa08b4e9079508f654134ec3b69a2eace62c66bf4')

package(){

  # Extract package data, move files to comply with Arch package guidelines
  # (https://wiki.archlinux.org/index.php/Arch_package_guidelines#Directories)
	tar -xf data.tar.xz -C "${pkgdir}" \
    --transform 's,^./usr/lib/x86_64-linux-gnu,./usr/lib,' \
    --transform 's,^./usr/libexec,./usr/lib,' \
    --transform 's,^./usr/share/dcvviewer/license/EULA.txt,./usr/share/licenses/dcvviewer/EULA,' \
    --transform 's,^./usr/share/dcvviewer\(/license\)\?$,.,' \
    --transform 's,^./usr/share/dcvviewer/third-party-licenses.txt,./usr/share/licenses/dcvviewer/LICENSE,' \
    --transform 's,^./usr/share/doc/nice-dcv-viewer/copyright,./usr/share/licenses/dcvviewer/COPYRIGHT,' \
    --transform 's,^./usr/share/doc\(/nice-dcv-viewer\)\?$,.,' \
    --exclude './usr/share/doc/nice-dcv-viewer/changelog.Debian.gz'
  
  # Update paths in launcher script
  sed -i 's|libdir=${basedir}/lib/x86_64-linux-gnu|libdir=${basedir}/lib|; s|libexecdir=${basedir}/libexec|libexecdir=${basedir}/lib|' \
    "${pkgdir}/usr/bin/dcvviewer"

}
