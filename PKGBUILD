# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: jiribb <jiribb@gmail.com>
# Contributor: David Spicer <azleifel at googlemail dot com>
# Contributor: Andrew Brouwers
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgbase=handbrake-full
pkgname=(handbrake-full handbrake-full-cli)
pkgver=1.6.1
pkgrel=2
pkgdesc="Multithreaded video transcoder. Enabled: x265, nvenc, fdk-aac, qsv, vce, numa, hardened"
arch=(i686 x86_64)
url="https://handbrake.fr/"
license=(GPL)
source=("${pkgbase%-full}::git+https://github.com/HandBrake/HandBrake.git#tag=${pkgver}"
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/AMF-1.4.24.tar.gz'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/dav1d-1.0.0.tar.bz2'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/fdk-aac-2.0.2.tar.gz'
        #'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/ffmpeg-4.4.1.tar.bz2'
        'https://ffmpeg.org/releases/ffmpeg-5.1.2.tar.bz2'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/libbluray-1.3.4.tar.bz2'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/libdvdnav-6.1.1.tar.bz2'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/libdvdread-6.1.3.tar.bz2'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/libvpx-1.7.0.tar.gz'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/mfx_dispatch-1.35.tar.gz'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/nv-codec-headers-11.0.10.1.tar.gz'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/oneVPL-2023.1.0.tar.gz'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/SVT-AV1-v1.4.1.tar.gz'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/x265-snapshot-20221130-12747.tar.gz'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/zimg-3.0.4.tar.gz')
_commondeps=(libxml2 libass libvorbis opus speex libtheora lame
             libx264.so jansson libvpx libva numactl)
_guideps=(gst-plugins-base gtk3 librsvg libgudev)
makedepends=(git intltool python nasm wget cmake meson
             x264
             "${_commondeps[@]}" "${_guideps[@]}")
optdepends=('libdvdcss: for decoding encrypted DVDs'
            'intel-media-sdk: for enabling Intel QSV'
            'nvidia-utils: for enabling Nvidia nvenc')
sha256sums=('SKIP'
            '07d325da97a5a3cb58d83c54b2ce1148dc84dc9bb3971b0c30ff4cc16e159194'
            '4a4eb6cecbc8c26916ef58886d478243de8bcc46710b369c04d6891b0155ac0f'
            '7812b4f0cf66acda0d0fe4302545339517e702af7674dd04e5fe22a5ade16a90'
            '39a0bcc8d98549f16c570624678246a6ac736c066cebdb409f9502e915b22f2b'
            '478ffd68a0f5dde8ef6ca989b7f035b5a0a22c599142e5cd3ff7b03bbebe5f2b'
            'c191a7475947d323ff7680cf92c0fb1be8237701885f37656c64d04e98d18d48'
            'ce35454997a208cbe50e91232f0e73fb1ac3471965813a13b8730a8f18a15369'
            '1fec931eb5c94279ad219a5b6e0202358e94a93a90cfb1603578c326abfc1238'
            '0790ff82158837124150ab4034db37433a92caac0f145f249d2f194d8ccba3ca'
            '97e37b85922f1167b2f0bf0bb804c3d7266cc679e78814fe820cf8912a0e1291'
            '0a1991278c64849f471e4b307a7c01f465a308674f359054886c32352e887b60'
            'e3f7fc194afc6c90b43e0b80fa24c09940cb03bea394e0e1f5d1ded18e9ab23f'
            '1a2418fd757a3d92928acacef2ae8ddb71f7aecc8803890eacb55f6e3a62bba5'
            '219d1bc6b7fde1355d72c9b406ebd730a4aed9c21da779660f0a4c851243e32f')
options=(!lto)
noextract=(
    'AMF-1.4.24.tar.gz'
    'dav1d-1.0.0.tar.bz2'
    'fdk-aac-2.0.2.tar.gz'
    'ffmpeg-5.1.2.tar.bz2'
    'libbluray-1.3.4.tar.bz2'
    'libdvdnav-6.1.1.tar.bz2'
    'libdvdread-6.1.3.tar.bz2'
    'libvpx-1.7.0.tar.gz'
    'mfx_dispatch-1.35.tar.gz'
    'nv-codec-headers-11.0.10.1.tar.gz'
    'oneVPL-2023.1.0.tar.gz'
    'SVT-AV1-v1.4.1.tar.gz'
    'x265-snapshot-20221130-12747.tar.gz'
    'zimg-3.0.4.tar.gz'
    )

prepare() {
  cd "${pkgbase%-full}"
  
  [ -d download ] || mkdir download
  for _tarball in ${noextract[@]}; do
    cp ../${_tarball} download/
  done
}

 build() {
  cd "${pkgbase%-full}"

  ./configure \
    --prefix=/usr \
    --harden \
    --disable-gtk-update-checks \
    --enable-x265 \
    --enable-numa \
    --enable-fdk-aac \
    --enable-nvenc \
    --enable-qsv \
    --enable-vce

  make -C build
}

package_handbrake-full() {
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

package_handbrake-full-cli() {
  pkgdesc="Multithreaded video transcoder (CLI)"
  depends=("${_commondeps[@]}")
  provides=(handbrake-cli)
  conflicts=(handbrake-cli)

  cd "$srcdir/handbrake/build"
  install -D HandBrakeCLI "$pkgdir/usr/bin/HandBrakeCLI"
}
