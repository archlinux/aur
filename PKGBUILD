# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: jiribb <jiribb@gmail.com>
# Contributor: David Spicer <azleifel at googlemail dot com>
# Contributor: Andrew Brouwers
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgbase=handbrake-dev-git
pkgname=(handbrake-dev-git handbrake-cli-dev-git)
pkgver=1.6.0.r299.g7ef971f80
pkgrel=1
pkgdesc="Multithreaded video transcoder. Enabled: x265, nvenc, fdk-aac, qsv, vce, numa, hardened. Master branch"
arch=(i686 x86_64)
url="https://handbrake.fr/"
license=(GPL2)
_commondeps=(libxml2 libass libvorbis opus speex libtheora lame libjpeg-turbo
             libx264.so jansson libvpx libva numactl)
_guideps=(gst-plugins-base gtk3 libgudev)
makedepends=(git intltool python nasm wget cmake meson llvm clang
             x264
             "${_commondeps[@]}" "${_guideps[@]}")
optdepends=('libdvdcss: for decoding encrypted DVDs'
            'intel-media-sdk: for enabling Intel QSV'
            'nvidia-utils: for Nvidia users, enable Nvidia nvenc'
            'cuda: for Nvidia users, enable Nvidia nvdec')
options=(!lto)
source=("handbrake::git+https://github.com/HandBrake/HandBrake.git"
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/AMF-1.4.29.tar.gz'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/dav1d-1.2.1.tar.bz2'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/fdk-aac-2.0.2.tar.gz'
        'https://ffmpeg.org/releases/ffmpeg-6.0.tar.bz2'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/libbluray-1.3.4.tar.bz2'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/libdvdnav-6.1.1.tar.bz2'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/libdvdread-6.1.3.tar.bz2'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/libvpx-1.7.0.tar.gz'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/mfx_dispatch-1.35.tar.gz'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/nv-codec-headers-12.0.16.tar.gz'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/oneVPL-2023.1.0.tar.gz'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/SVT-AV1-v1.5.0.tar.gz'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/x265-snapshot-20230403-12776.tar.gz'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/zimg-3.0.4.tar.gz')
noextract=(
    'AMF-1.4.29.tar.gz'
    'dav1d-1.2.1.tar.bz2'
    'fdk-aac-2.0.2.tar.gz'
    'ffmpeg-6.0.tar.bz2'
    'libbluray-1.3.4.tar.bz2'
    'libdvdnav-6.1.1.tar.bz2'
    'libdvdread-6.1.3.tar.bz2'
    'libvpx-1.7.0.tar.gz'
    'mfx_dispatch-1.35.tar.gz'
    'nv-codec-headers-12.0.16.tar.gz'
    'oneVPL-2023.1.0.tar.gz'
    'SVT-AV1-v1.5.0.tar.gz'
    'x265-snapshot-20230403-12776.tar.gz'
    'zimg-3.0.4.tar.gz'
    )
sha256sums=('SKIP'
            '5608db714889db185fc85cac89f011e5c444bf14eb9b9c32ca91b6f39286c660'
            'a4003623cdc0109dec3aac8435520aa3fb12c4d69454fa227f2658cdb6dab5fa'
            '7812b4f0cf66acda0d0fe4302545339517e702af7674dd04e5fe22a5ade16a90'
            '47d062731c9f66a78380e35a19aac77cebceccd1c7cc309b9c82343ffc430c3d'
            '478ffd68a0f5dde8ef6ca989b7f035b5a0a22c599142e5cd3ff7b03bbebe5f2b'
            'c191a7475947d323ff7680cf92c0fb1be8237701885f37656c64d04e98d18d48'
            'ce35454997a208cbe50e91232f0e73fb1ac3471965813a13b8730a8f18a15369'
            '1fec931eb5c94279ad219a5b6e0202358e94a93a90cfb1603578c326abfc1238'
            '0790ff82158837124150ab4034db37433a92caac0f145f249d2f194d8ccba3ca'
            '936c368afe33e27cb40deb1f3bad569ea94faf7920e7b15fc9a2f19853baf157'
            '0a1991278c64849f471e4b307a7c01f465a308674f359054886c32352e887b60'
            '64e27b024eb43e4ba4e7b85584e0497df534043b2ce494659532c585819d0333'
            '23898695c5520e9e971d12e88125d5ad03ad67f462fc8ecaa016b48adad7cb20'
            '219d1bc6b7fde1355d72c9b406ebd730a4aed9c21da779660f0a4c851243e32f')

pkgver() {
  cd handbrake
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd handbrake
  [ -d download ] || mkdir download
  for _tarball in ${noextract[@]}; do
    cp ../${_tarball} download/
  done
}

 build() {
  cd handbrake

  ./configure \
    --prefix=/usr \
    --harden \
    --enable-x265 \
    --enable-numa \
    --enable-fdk-aac \
    --enable-nvenc \
    --enable-qsv \
    --enable-vce

  make -C build
}

package_handbrake-dev-git() {
  pkgdesc="Multithreaded video transcoder"
  depends=("${_commondeps[@]}" "${_guideps[@]}")
  optdepends+=('gst-plugins-good: for video previews'
              'gst-libav: for video previews')
  provides=(handbrake)
  conflicts=(handbrake)

  cd "$srcdir/handbrake/build"

  make DESTDIR="$pkgdir" install
  rm "$pkgdir/usr/bin/HandBrakeCLI"
}

package_handbrake-cli-dev-git() {
  pkgdesc="Multithreaded video transcoder (CLI)"
  depends=("${_commondeps[@]}" libjpeg-turbo)
  provides=(handbrake-cli)
  conflicts=(handbrake-cli)

  cd "$srcdir/handbrake/build"
  install -D HandBrakeCLI "$pkgdir/usr/bin/HandBrakeCLI"
}
