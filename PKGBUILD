# Maintainer:  ahjolinna <@yahoo.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>

# WARNING: The configure script will automatically enable any optional
# features it finds support for on your system. If you want to avoid
# linking against something you have installed, you'll have to disable
# it in the configure below. The package() script will attempt to
# update the dependencies based on dynamic libraries when packaging..
pkgname=mpv-ahjolinna
_gitname=mpv
pkgver=0.30.0
pkgrel=10
pkgdesc="MPV using ahjolinna's personal pre-made conf build"
arch=('x86_64')
license=('GPL')
url='http://mpv.io'
_undetected_depends=('desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils')
depends=(
# official repositories:
'lcms2' 'libcdio-paranoia' 'libgl' 'libxss'
'libxinerama' 'libxv' 'libxkbcommon' 'libva'
 'wayland' 'libcaca' 'libplacebo' 'desktop-file-utils'
 'hicolor-icon-theme' 'xdg-utils' 'lua52' 'libdvdnav' 'rsound'
'libxrandr' 'jack' 'rubberband' 'uchardet'  'libarchive' 'smbclient'
'zlib' 'sndio' 'openal' 'vulkan-icd-loader' 'shaderc' "${_undetected_depends[@]}"

# AUR:
'ffmpeg-full-git' 'mujs' 'vapoursynth-git'
)

optdepends=('youtube-dl: Another way to view youtuve videos with mpv'
            'zsh-completions: Additional completion definitions for Zsh users'
            'livestreamer: to watch live video streams (twitch.tv)'
            'vapoursynth-plugin-mvtools: Realtime motion interpolating playback in mpv'
            'acpitool: for battery detection'
            'inxi: HIDPI-detection'
            'svp: SmoothVideo Project'
            'adobe-source-sans-pro-fonts: Font as shown in the conf'
            )

makedepends=('vulkan-headers' 'mesa' 'python-docutils'
             'ladspa' 'x265' 'openal' 'jack' 'unzip'
             'samba' 'acpitool' 'inxi' 'git' 'vapoursynth'
             'libvdpau' 'libva' 'streamlink' 'cuda'
             'ffnvcodec-headers' 'youtube-dl' 'ffnvcodec-headers')
optdepends+=('cuda: for CUVID hardware-acceleration for NVIDIA users')

provides=('mpv' 'mpv-git')
conflicts=('mpv' 'mpv-vapoursynth' 'mpv-ahjolinna-build-git' 'mpv-build-git' 'mpv-ahjolinna' )
options=('!emptydirs')
source=(https://github.com/mpv-player/mpv/archive/v$pkgver.tar.gz
        'git+https://github.com/ahjolinna/mpv-conf'
        'find-deps.py'
        'mpv-hq.desktop'
         'mpv-lq.desktop'
         'mpv-mq.desktop'
         'mpv-MVtools.desktop'
         'mpv-SVP.desktop'
         'mpv-CUDA.desktop')

sha256sums=('33a1bcb7e74ff17f070e754c15c52228cf44f2cefbfd8f34886ae81df214ca35'
            'SKIP'
            'ce974e160347202e0dc63f6a7a5a89e52d2cc1db2d000c661fddb9dc1d007c02'
            'ddd18dbccdaa4513586cb97299e88564e3289940f25d7ebe762c4482fbad3809'
            'e02f7b07653ea4ce9745b9f699954f5a4eafd416ada5a5d032c7dd7294921f90'
            '8cf41f23572417836084209fce343f779e72dea9688dc84e23e8eb913d002d5f'
            '9a7f7d78a71c5492709abfb8f4ad598fa02867e71b5645bb639850163264762b'
            '6e1d8057524f69f204f0f0468e7d4f8f6b41a6d22ac1e4bdf3bc1e2efa0e0284'
            'b703510f6e1f36d3f00008c282c7fef52057aa5703b412a7b750fb05c3a6a2e5')

prepare() {
  cd "${srcdir}/mpv-$pkgver"
./bootstrap.py

}

build() {
  cd "${srcdir}/mpv-$pkgver"
 ./waf configure \
	--color='yes' \
	--prefix='/usr' \
	--progress \
	--confdir='/etc/mpv' \
	\
	--disable-lgpl \
	--enable-libmpv-shared \
	--disable-libmpv-static \
	--disable-static-build \
	--disable-debug-build \
	\
	--enable-manpage-build \
	--disable-html-build \
	--disable-pdf-build \
	\
	--enable-cplugins \
	--disable-test \
	--disable-clang-database \
	\
	--disable-android \
	--disable-uwp \
	--disable-win32-internal-pthreads \
	--enable-iconv \
	--enable-libsmbclient \
	--enable-lua \
	--enable-javascript \
	--enable-libass \
	--enable-libass-osd \
	--enable-zlib \
	--enable-uchardet \
	--enable-rubberband \
	--enable-lcms2 \
	--enable-vapoursynth \
	--enable-libarchive \
	--enable-libavdevice \
	--lua='52arch' \
	\
	--enable-sdl2 \
	--enable-oss-audio \
	--enable-rsound \
	--enable-sndio \
	--enable-pulse \
	--enable-jack \
	--enable-openal \
	--disable-opensles \
	--enable-alsa \
	--disable-coreaudio \
	--disable-audiounit \
	--disable-wasapi \
	\
	--disable-cocoa \
	--enable-drm \
	--enable-drmprime \
	--enable-gbm \
	--enable-wayland-scanner \
	--enable-wayland-protocols \
	--enable-wayland \
	--enable-x11 \
	--enable-xv \
	--disable-gl-cocoa \
	--enable-gl-x11 \
	--enable-egl-x11 \
	--enable-egl-drm \
	--enable-gl-wayland \
	--disable-gl-win32 \
	--disable-gl-dxinterop \
	--disable-egl-angle \
	--disable-egl-angle-lib \
	--disable-egl-angle-win32 \
	--enable-vdpau \
	--enable-vdpau-gl-x11 \
	--enable-vaapi \
	--enable-vaapi-x11 \
	--enable-vaapi-wayland \
	--enable-vaapi-drm \
	--enable-vaapi-x-egl \
	--enable-caca \
	--enable-jpeg \
	--disable-direct3d \
	--enable-shaderc \
	--disable-d3d11 \
	--disable-rpi \
	--disable-ios-gl \
	--enable-plain-gl \
	--enable-gl \
	--enable-vulkan \
	\
	--disable-videotoolbox-gl \
	--disable-d3d-hwaccel \
	--disable-d3d9-hwaccel \
	--disable-gl-dxinterop-d3d9 \
	\
	--enable-dvbin \
	\
	--disable-apple-remote \
	--disable-macos-touchbar \
	--disable-macos-cocoa-cb \
  --disable-tvos

	./waf build
}
package() {
  cd "$srcdir/mpv-$pkgver"
  ./waf install --destdir="${pkgdir}"


 # install the .desktop files
  install -Dm644 "${srcdir}/mpv-lq.desktop" "${pkgdir}/usr/share/applications/mpv-lq.desktop"
  install -Dm644 "${srcdir}/mpv-mq.desktop" "${pkgdir}/usr/share/applications/mpv-mq.desktop"
  install -Dm644 "${srcdir}/mpv-hq.desktop" "${pkgdir}/usr/share/applications/mpv-hq.desktop"
  install -Dm644 "${srcdir}/mpv-MVtools.desktop" "${pkgdir}/usr/share/applications/mpv-MVtools.desktop"
  install -Dm644 "${srcdir}/mpv-CUDA.desktop" "${pkgdir}/usr/share/applications/mpv-CUDA.desktop"
  install -Dm644 "${srcdir}/mpv-SVP.desktop" "${pkgdir}/usr/share/applications/mpv-SVP.desktop"


  # install BT.709 ICC profiles (https://github.com/mpv-player/mpv/issues/534#issuecomment-35823203)

   cd ${srcdir}/mpv-conf/PKGBUILD
   unzip BT.709_Profiles.zip
   install -Dm755 "BT.709_Profiles/BT.709.gamma.1.95.icc" "${pkgdir}/usr/share/color/icc/BT.709_Profiles/BT.709.gamma.1.95.icc"
   install -Dm755 "BT.709_Profiles/BT.709.gamma.1.95.icc" "${pkgdir}/usr/share/color/icc/BT.709_Profiles/BT.709.icc"
   install -Dm755 "BT.709_Profiles/BT.709.gamma.1.95.icc" "${pkgdir}/usr/share/color/icc/BT.709_Profiles/BT.709.linear.icc"

    #install ahjolinna "config-build" files
 cp -R ${srcdir}/mpv-conf/mpv/etc/* ${pkgdir}/etc/mpv
    install -d "${pkgdir}/etc/mpv/"

cp $srcdir/$_gitname/etc/encoding-profiles.conf ${pkgdir}/etc/mpv

  # Update dependencies automatically based on dynamic libraries
  _detected_depends=($("$srcdir"/find-deps.py "$pkgdir"/usr/{bin/mpv,lib/libmpv.so}))

  msg 'Auto-detected dependencies:'
  echo "${_detected_depends[@]}" | fold -s -w 79 | sed 's/^/ /'
  depends=("${_detected_depends[@]}" "${_undetected_depends[@]}")
}
