# Maintainer : Shawn Dellysse sdellysse@gmail.com

### Need an old version of expat for parsec to not segfault on connect.
### Download expat-2.2.4 from here: https://archive.archlinux.org/packages/e/expat/expat-2.2.4-1-x86_64.pkg.tar.xz
### sudo pacman -U expat-2.2.4*
### add expat to the IgnorePkg line in /etc/pacman.conf and uncomment the line

### You do not need to install any VA-API packages. This build includes the
### specific libraries parsec needs.

### on first run, parsec will fail to start. This creates the configuration
### directories. On second run, parsec will start fine.

### Credit: https://gist.github.com/aoleg94/ee1bcf82d68ddbc6073cd77b39a1fc8b#file-pkgbuild-L39

UBUNTU_MIRROR="http://archive.ubuntu.com/ubuntu"

pkgname=parsec-bin
pkgver=139_8
pkgrel=2
pkgdesc="Remotely connect to a gaming pc for a low latency remote computing experience"
url=http://parsec.tv
arch=('x86_64')
provides=('parsec')
conflicts=('parsec')
depends=('glibc' 'pulseaudio-module-sndio' 'expat<=2.2.4')
source=(
  "${UBUNTU_MIRROR}/pool/universe/i/intel-vaapi-driver/i965-va-driver_1.7.0-1_amd64.deb"
  "${UBUNTU_MIRROR}/pool/universe/libv/libva/libva-drm1_1.7.0-1_amd64.deb"
  "${UBUNTU_MIRROR}/pool/universe/libv/libva/libva-egl1_1.7.0-1_amd64.deb"
  "${UBUNTU_MIRROR}/pool/universe/libv/libva/libva-glx1_1.7.0-1_amd64.deb"
  "${UBUNTU_MIRROR}/pool/universe/libv/libva/libva-wayland1_1.7.0-1_amd64.deb"
  "${UBUNTU_MIRROR}/pool/universe/libv/libva/libva-x11-1_1.7.0-1_amd64.deb"
  "${UBUNTU_MIRROR}/pool/universe/libv/libva/libva1_1.7.0-1_amd64.deb"
  "${UBUNTU_MIRROR}/pool/universe/v/vdpau-video/vdpau-va-driver_0.7.4-5_amd64.deb"
  "https://s3.amazonaws.com/parsec-build/package/parsec-linux.deb"
)
md5sums=('b2607f82422e4de75df474fc4d9ec682'
         'd0455e1f955862e60b28dd6a926c9a19'
         '76afa64c4c6390c27c83e04fbaf5763a'
         'af58cfc1cae586235c09616189bfffe3'
         'c1d54fcc312f51dea259d9e3804b5a6d'
         'bcdd976b32d1d0f615a202b761379497'
         '8b81c77b09b8cb02fa513dc5b72ea762'
         '8362265530432f1de9c3db031b0b8779'
         '438177b6f9d81f7eb1f093d920193295')
package() {
  for filename in *.deb; do
    ar p "$filename" data.tar.xz | tar xJ -C "${pkgdir}"
  done

  mv ${pkgdir}/usr/lib/x86_64-linux-gnu/*.so.1* "${pkgdir}/usr/lib"
}
