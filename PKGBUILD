# Maintainer: Lone_Wolf <lonewolf at xs4all dot nl>
# Contributor: Armin K. <krejzi at email dot com>
# Contributor: Jesse Jaara <jesse.jaara@gmail.com>
# Contributor: Kristian Klausen <klausenbusk@hotmail.com>
# Contributor: Egon Ashrafinia <e.ashrafinia@gmail.com>
# Contributor: Tavian Barnes <tavianator@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Antti "Tera" Oja <antti.bofh@gmail.com>
# Contributor: Diego Jose <diegoxter1006@gmail.com>

pkgbase=lib32-mesa-git
pkgname=('lib32-mesa-vdpau-git' 'lib32-mesa-vulkan-intel-git' 'lib32-mesa-libgl-git' 'lib32-libva-mesa-driver-git' 'lib32-mesa-git')
pkgdesc="an open-source implementation of the OpenGL specification, git version for multilib applications"
pkgver=11.3.0_devel.80749.7e7710a
pkgrel=1
arch=('x86_64')
makedepends=('python2' 'lib32-libxml2' 'lib32-expat' 'lib32-libx11' 'glproto' 'lib32-libdrm>=2.4.66' 'dri2proto' 'dri3proto' 'presentproto'
             'lib32-libxshmfence' 'lib32-libxxf86vm' 'lib32-libxdamage' 'gcc-multilib' 'lib32-elfutils'  'lib32-systemd'
             'lib32-libvdpau' 'lib32-wayland' 'python2-mako' 'lib32-libtxc_dxtn' 'git' 'lib32-nettle'
             'mesa-git' 'libva-mesa-driver-git' 'mesa-vdpau-git' 'mesa-libgl-git' 'mesa-vulkan-intel-git' 'lib32-llvm-libs-svn' 'lib32-llvm-svn' 'lib32-libxvmc'
             )
url="http://mesa3d.sourceforge.net"
license=('custom')
source=('mesa::git://anongit.freedesktop.org/mesa/mesa#branch=master'
        'LICENSE')
md5sums=('SKIP'
         '5c65a0fe315dd347e09b1f2826a1df5a'
         )

pkgver() {
    cd "${srcdir}/mesa"
    echo $(cat VERSION | tr "-" "_").$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

_mesaver() {
    path="${srcdir}/mesa/VERSION"
    [ -f $path ] && cat "$path"
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export LLVM_CONFIG=/usr/bin/llvm-config32

  cd "${srcdir}/mesa"

  ./autogen.sh --build=i686-pc-linux-gnu --host=i686-pc-linux-gnu \
               --libdir=/usr/lib32 \
               --prefix=/usr \
               --sysconfdir=/etc \
               --with-dri-driverdir=/usr/lib32/xorg/modules/dri \
               --with-gallium-drivers=i915,ilo,r300,r600,radeonsi,nouveau,swrast,virgl \
               --with-dri-drivers=i915,i965,r200,radeon,nouveau,swrast \
               --with-egl-platforms=x11,drm,wayland \
               --with-sha1=libnettle \
               --enable-texture-float \
               --enable-dri3 \
               --enable-osmesa \
               --enable-xa \
               --enable-gbm \
               --enable-nine \
               --enable-xvmc \
               --enable-vdpau \
               --enable-va \
               --with-va-libdir=/usr/lib32/dri \
               --enable-glx-tls
#               --with-vulkan-drivers=intel \
               
#
# configure flag                description                                                             default                                         overridden
#  --enable-debug               use debug compiler flags and macros                                     [default=disabled]
#  --enable-profile             enable profiling of code                                                [default=disabled]
#  --enable-mangling            enable mangled symbols and library name                                 [default=disabled]
#  --enable-texture-float       enable floating-point textures and renderbuffers                        [default=disabled]                              enabled
#  --disable-asm                disable assembly usage                                                  [default=enabled on supported  plaforms]
#  --enable-selinux             Build SELinux-aware Mesa                                                [default=disabled]
#  --disable-opengl             disable support for standard OpenGL API                                 [default=enabled]
#  --disable-gles1              disable support for OpenGL ES 1.x API                                   [default=enabled]
#  --disable-gles2              disable support for OpenGL ES 2.x API                                   [default=enabled]
#  --enable-dri                 enable DRI modules                                                      [default=enabled]
#  --enable-dri3                enable DRI3                                                             [default=auto]                                  enabled
#  --enable-glx                 enable GLX library                                                      [default=enabled]
#  --enable-osmesa              enable OSMesa library                                                   [default=disabled]                              enabled
#  --enable-gallium-osmesa      enable Gallium implementation of the OSMesa library                     [default=disabled]
#  --disable-egl                disable EGL library                                                     [default=enabled]
#  --enable-xa                  enable build of the XA X Acceleration API                               [default=disabled]                              enabled
#  --enable-gbm                 enable gbm library                                                      [default=auto]                                  enabled
#  --enable-nine                enable build of the nine Direct3D9 API                                  [default=no]                                    enabled
#  --enable-xvmc                enable xvmc library                                                     [default=auto]                                  enabled
#  --enable-vdpau               enable vdpau library                                                    [default=auto]                                  enabled
#  --enable-omx                 enable OpenMAX library                                                  [default=disabled]
#  --enable-va                  enable va library                                                       [default=auto]                                  enabled
#  --enable-opencl              enable OpenCL library                                                   [default=disabled]
#  --enable-opencl-icd          Build an OpenCL ICD library to be loaded by an ICD implementation       [default=disabled]
#  --enable-xlib-glx             make GLX library Xlib-based instead of DRI-based                       [default=disabled]
#  --enable-r600-llvm-compiler   Enable experimental LLVM backend for graphics shaders                  [default=disabled]
#  --enable-gallium-tests        Enable optional Gallium tests)                                         [default=disabled]
#  --enable-shared-glapi         Enable shared glapi for OpenGL                                         [default=enabled]
#  --disable-shader-cache        Disable binary shader cache
#  --enable-sysfs                enable /sys PCI identification                                         [default=disabled]
#  --disable-driglx-direct      disable direct rendering in GLX and EGL for DRI                         [default=auto]
#  --enable-glx-tls             enable TLS support in GLX                                               [default=disabled]                              enabled
#  --enable-glx-read-only-text  Disable writable .text section on x86 (decreases performance)           [default=disabled]
#  --enable-gallium-llvm        build gallium LLVM support                                              [default=enabled on x86/x86_64]
#  --enable-llvm-shared-libs    link with LLVM shared libraries                                         [default=enabled]
#

  make

  # fake installation
  mkdir -p "${srcdir}/fakeinstall"
  make DESTDIR="${srcdir}/fakeinstall" install
}

package_lib32-libva-mesa-driver-git() {
  pkgdesc="VA-API implementation for gallium (32-bit)"
  depends=('lib32-libdrm' 'lib32-libx11' 'lib32-llvm-libs-svn' 'lib32-expat' 'lib32-elfutils' 'lib32-nettle' 'libva-mesa-driver-git')
  provides=("lib32-libva-mesa-driver=$(_mesaver)")
  conflicts=('lib32-libva-mesa-driver')

  install -v -m755 -d "${pkgdir}/usr/lib32"
  mv -v "${srcdir}/fakeinstall/usr/lib32/dri" "${pkgdir}/usr/lib32/"

  install -v -m755 -d "${pkgdir}/usr/share/licenses/lib32-libva-mesa-driver-git"
  install -v -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/lib32-libva-mesa-driver-git/"
}

package_lib32-mesa-vulkan-intel-git() {
  pkgdesc="Vulkan driver for selected intel graphic chipsets"
  depends=('lib32-wayland' 'lib32-libxcb' 'lib32-libxshmfence' 'lib32-nettle' 'mesa-vulkan-intel-git')
  provides=('lib32-vulkan-intel')
  replaces=('lib32-vulkan-intel')
  conflicts=('lib32-vulkan-intel')
  
# skipping files installed by mesa-vulkan-intel-git
#  install -m755 -d ${pkgdir}/etc
#  mv -v ${srcdir}/fakeinstall/etc/vulkan ${pkgdir}/etc/

  #install -m755 -d ${pkgdir}/usr/lib32
  #mv -v ${srcdir}/fakeinstall/usr/lib32/libvulkan_intel.so ${pkgdir}/usr/lib32/
  
# already installed by mesa-vulkan-intel-git
#  mv -v ${srcdir}/fakeinstall/usr/include/vulkan/vulkan_intel.h ${pkgdir}/usr/include/vulkan

  install -m755 -d "${pkgdir}/usr/share/licenses/lib32-mesa-vulkan-intel-git"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/lib32-mesa-vulkan-intel-git/"
}

package_lib32-mesa-vdpau-git() {
  pkgdesc="Mesa VDPAU drivers (32-bit)"
  depends=('lib32-libdrm' 'lib32-libx11' 'lib32-expat' 'lib32-llvm-libs-svn' 'lib32-elfutils' 'mesa-vdpau-git' 'lib32-nettle')
  provides=('lib32-mesa-vdpau')
  replaces=('lib32-mesa-vdpau')
  conflicts=('lib32-mesa-vdpau')

  install -v -m755 -d "${pkgdir}/usr/lib32"
  mv -v "${srcdir}/fakeinstall/usr/lib32/vdpau" "${pkgdir}/usr/lib32/"

  install -v -m755 -d "${pkgdir}/usr/share/licenses/lib32-mesa-vdpau-git"
  install -v -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/lib32-mesa-vdpau-git/"
}

package_lib32-mesa-git() {
  pkgdesc="an open-source implementation of the OpenGL specification (32-bit)"
  depends=('lib32-libdrm' 'lib32-libxxf86vm' 'lib32-libxdamage' 'lib32-libxshmfence' 'lib32-systemd'
           'lib32-elfutils' 'lib32-llvm-libs-svn' 'lib32-wayland' 'lib32-libtxc_dxtn' 'mesa-git' 'lib32-libxvmc' 'lib32-nettle')
  optdepends=('opengl-man-pages: for the OpenGL API man pages'
              'lib32-mesa-vdpau-git: for accelerated video playback')
  provides=("lib32-mesa=$(_mesaver)" 'lib32-mesa-dri' 'lib32-mesa-r300-r600-radeonsi-git')
  replaces=('lib32-mesa' 'lib32-mesa-dri' 'lib32-mesa-r300-r600-radeonsi-git' )
  conflicts=('lib32-mesa' 'lib32-mesa-dri' 'lib32-mesa-r300-r600-radeonsi-git' )
  
  install -v -m755 -d "${pkgdir}/usr/lib32/xorg/modules/dri"
  # ati-dri, nouveay-dri, intel-dri, swrast
  mv -v "${srcdir}"/fakeinstall/usr/lib32/xorg/modules/dri/* "${pkgdir}/usr/lib32/xorg/modules/dri/"

  install -v -m755 -d "${pkgdir}/usr/lib32"
  mv -v "${srcdir}"/fakeinstall/usr/lib32/d3d "${pkgdir}/usr/lib32/"
  mv -v "${srcdir}"/fakeinstall/usr/lib32/*.so* "${pkgdir}/usr/lib32/"

  mv -v "${srcdir}/fakeinstall/usr/lib32/pkgconfig" "${pkgdir}/usr/lib32/"

  install -v -m755 -d "${pkgdir}/usr/lib32/mesa"
  # move libgl/EGL/glesv*.so to not conflict with blobs - may break .pc files ?
  mv -v "${pkgdir}"/usr/lib32/libGL.so*    "${pkgdir}/usr/lib32/mesa/"
  mv -v "${pkgdir}"/usr/lib32/libEGL.so*   "${pkgdir}/usr/lib32/mesa/"
  mv -v "${pkgdir}"/usr/lib32/libGLES*.so* "${pkgdir}/usr/lib32/mesa/"

  install -v -m755 -d "${pkgdir}/usr/share/licenses/lib32-mesa-git"
  install -v -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/lib32-mesa-git/"
}

package_lib32-mesa-libgl-git() {
  pkgdesc="Mesa 3-D graphics library (32-bit)"
  depends=('lib32-mesa-git')
  provides=("lib32-mesa-libgl=$(_mesaver)" "lib32-libgl=$(_mesaver)")
  replaces=('lib32-mesa-libgl')
  conflicts=('lib32-mesa-libgl')

  install -m755 -d "${pkgdir}/usr/lib32"

  ln -sv /usr/lib32/mesa/libGL.so.1.2.0 "${pkgdir}/usr/lib32/libGL.so.1.2.0"
  ln -sv libGL.so.1.2.0                 "${pkgdir}/usr/lib32/libGL.so.1"
  ln -sv libGL.so.1.2.0                 "${pkgdir}/usr/lib32/libGL.so"

  ln -sv /usr/lib32/mesa/libEGL.so.1.0.0 "${pkgdir}/usr/lib32/libEGL.so.1.0.0"
  ln -sv libEGL.so.1.0.0                 "${pkgdir}/usr/lib32/libEGL.so.1"
  ln -sv libEGL.so.1.0.0                 "${pkgdir}/usr/lib32/libEGL.so"

  ln -sv /usr/lib32/mesa/libGLESv1_CM.so.1.1.0 "${pkgdir}/usr/lib32/libGLESv1_CM.so.1.1.0"
  ln -sv libGLESv1_CM.so.1.1.0                 "${pkgdir}/usr/lib32/libGLESv1_CM.so.1"
  ln -sv libGLESv1_CM.so.1.1.0                 "${pkgdir}/usr/lib32/libGLESv1_CM.so"

  ln -sv /usr/lib32/mesa/libGLESv2.so.2.0.0 "${pkgdir}/usr/lib32/libGLESv2.so.2.0.0"
  ln -sv libGLESv2.so.2.0.0                 "${pkgdir}/usr/lib32/libGLESv2.so.2"
  ln -sv libGLESv2.so.2.0.0                 "${pkgdir}/usr/lib32/libGLESv2.so"

  install -v -m755 -d "${pkgdir}/usr/share/licenses/lib32-mesa-libgl-git"
  install -v -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/lib32-mesa-libgl-git/"
}
