# Maintainer: Ted Gregor <teddyg522@gmail.com>
pkgname=teamviewer11
pkgver=11.0.67687
pkgrel=1
pkgdesc="All-in-one software for remote support and online meetings"
arch=('i686' 'x86_64')
url="http://www.teamviewer.com"
license=('custom')
# Binaries can't be stripped
options=('!strip')
source_x86_64=("https://download.teamviewer.com/download/version_11x/teamviewer_amd64.deb")
source_i686=("https://download.teamviewer.com/download/version_11x/teamviewer_i386.deb")
depends_x86_64=(
    'lib32-fontconfig'
    'lib32-libpng12'
    'lib32-libsm'
    'lib32-libxinerama'
    'lib32-libxrender'
    'lib32-libjpeg6-turbo'
    'lib32-libxtst'
    'libxtst')
depends_i686=(
    'fontconfig'
    'libpng12'
    'libsm'
    'libxinerama'
    'libxrender'
    'libjpeg6-turbo'
    'libxtst')
provides=('teamviewer')
conflicts=('teamviewer' 'teamviewer-beta' 'teamviewer10' 'teamviewer9' 'teamviewer8')
install=teamviewer11.install
md5sums_i686=('312d6eea860a9314e19140a8a9378e1d')
md5sums_x86_64=('2504895aa8e50da78d68235630402c51')

prepare() {
    tar -xf data.tar.bz2
}

package() {
    cp -dr --no-preserve=ownership {etc,opt,usr,var} "${pkgdir}"
    install -D -m 0644 "${pkgdir}"/opt/teamviewer/tv_bin/script/teamviewerd.service "${pkgdir}"/usr/lib/systemd/system/teamviewerd.service
    install -d -m 0755 "${pkgdir}"/usr/{share/applications,share/licenses/teamviewer11}
    mv opt/teamviewer/tv_bin/desktop/teamviewer-teamviewer11.desktop "${pkgdir}"/usr/share/applications/teamviewer.desktop
    ln -s /opt/teamviewer/doc/License_Full.txt "${pkgdir}"/usr/share/licenses/teamviewer11/LICENSE
}
