# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Alexandre Bouvier <contact@amb.tf>

pkgname=xemu
pkgver=0.7.99
pkgrel=1
pkgdesc='Original Xbox Emulator'
arch=('x86_64')
url='https://xemu.app'
license=('GPL2')
depends=(
  'glibc'
  'gcc-libs'
  'glib2'
  'openssl'
  'keyutils'
  'pixman'
  'libepoxy'
  'hicolor-icon-theme'
  'libpcap'
  'zlib'
  'sdl2'
  'libsamplerate'
  'gtk3'
  'libslirp'
)
makedepends=(
  'git'
  'glu'
  'meson'
  'python'
  'python-yaml'
  'samurai'
)
optdepends=(
  'fancy-mouse-boot-rom: first-stage xbox bootrom'
)
_commit='158cc0d14001450c082e17ffd8cd407ac795525e'
source=(
  "$pkgname::git+https://github.com/mborgerson/xemu.git#commit=$_commit"
  "gitlab.com-qemu-project-QemuMacDrivers::git+https://gitlab.com/qemu-project/QemuMacDrivers.git"
  "gitlab.com-qemu-project-SLOF::git+https://gitlab.com/qemu-project/SLOF.git"
  "gitlab.com-qemu-project-berkeley-softfloat-3::git+https://gitlab.com/qemu-project/berkeley-softfloat-3.git"
  "gitlab.com-qemu-project-berkeley-testfloat-3::git+https://gitlab.com/qemu-project/berkeley-testfloat-3.git"
  "gitlab.com-qemu-project-dtc::git+https://gitlab.com/qemu-project/dtc.git"
  "gitlab.com-qemu-project-edk2::git+https://gitlab.com/qemu-project/edk2.git"
  "gitlab.com-qemu-project-ipxe::git+https://gitlab.com/qemu-project/ipxe.git"
  "gitlab.com-qemu-project-keycodemapdb::git+https://gitlab.com/qemu-project/keycodemapdb.git"
  "gitlab.com-qemu-project-libvfio-user::git+https://gitlab.com/qemu-project/libvfio-user.git"
  "gitlab.com-qemu-project-meson::git+https://gitlab.com/qemu-project/meson.git"
  "gitlab.com-qemu-project-openbios::git+https://gitlab.com/qemu-project/openbios.git"
  "gitlab.com-qemu-project-opensbi::git+https://gitlab.com/qemu-project/opensbi.git"
  "gitlab.com-qemu-project-qboot::git+https://gitlab.com/qemu-project/qboot.git"
  "gitlab.com-qemu-project-qemu-palcode::git+https://gitlab.com/qemu-project/qemu-palcode.git"
  "gitlab.com-qemu-project-seabios-hppa::git+https://gitlab.com/qemu-project/seabios-hppa.git"
  "gitlab.com-qemu-project-seabios::git+https://gitlab.com/qemu-project/seabios.git/"
  "gitlab.com-qemu-project-sgabios::git+https://gitlab.com/qemu-project/sgabios.git"
  "gitlab.com-qemu-project-skiboot::git+https://gitlab.com/qemu-project/skiboot.git"
  "gitlab.com-qemu-project-u-boot-sam460ex::git+https://gitlab.com/qemu-project/u-boot-sam460ex.git"
  "gitlab.com-qemu-project-u-boot::git+https://gitlab.com/qemu-project/u-boot.git"
  "gitlab.com-qemu-project-vbootrom::git+https://gitlab.com/qemu-project/vbootrom.git"
  "github.com-mborgerson-genconfig::git+https://github.com/mborgerson/genconfig.git"
  "github.com-ocornut-imgui::git+https://github.com/ocornut/imgui.git"
  "github.com-epezent-implot::git+https://github.com/epezent/implot.git"
  "gitlab.com-libvirt-libvirt-ci::git+https://gitlab.com/libvirt/libvirt-ci.git"
  "github.com-abaire-nv2a_vsh_cpu::git+https://github.com/abaire/nv2a_vsh_cpu.git"
  "github.com-marzer-tomlplusplus::git+https://github.com/marzer/tomlplusplus"
  "github.com-Cyan4973-xxHash::git+https://github.com/Cyan4973/xxHash.git"
)
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed -e 's/^v//'
}

prepare() {
  cd "$pkgname"

# Update the prepare function in your PKGBUILD to initialize the submodules:
  git submodule init

  git config submodule."dtc".url "$srcdir/gitlab.com-qemu-project-dtc"
  git config submodule."genconfig".url "${srcdir}/github.com-mborgerson-genconfig"
  git config submodule."hw/xbox/nv2a/thirdparty/nv2a_vsh_cpu".url "$srcdir/github.com-abaire-nv2a_vsh_cpu"
  git config submodule."hw/xbox/nv2a/xxHash".url "${srcdir}/github.com-Cyan4973-xxHash"
  git config submodule."meson".url "${srcdir}/gitlab.com-qemu-project-meson"
  git config submodule."roms/QemuMacDrivers".url "$srcdir/gitlab.com-qemu-project-QemuMacDrivers"
  git config submodule."roms/SLOF".url "${srcdir}/gitlab.com-qemu-project-SLOF"
  git config submodule."roms/edk2".url "${srcdir}/gitlab.com-qemu-project-edk2"
  git config submodule."roms/ipxe".url "${srcdir}/gitlab.com-qemu-project-ipxe"
  git config submodule."roms/openbios".url "${srcdir}/gitlab.com-qemu-project-openbios"
  git config submodule."roms/opensbi".url "${srcdir}/gitlab.com-qemu-project-opensbi"
  git config submodule."roms/qboot".url "${srcdir}/gitlab.com-qemu-project-qboot"
  git config submodule."roms/qemu-palcode".url "${srcdir}/gitlab.com-qemu-project-qemu-palcode"
  git config submodule."roms/seabios".url "${srcdir}/gitlab.com-qemu-project-seabios"
  git config submodule."roms/seabios-hppa".url "${srcdir}/gitlab.com-qemu-project-seabios-hppa"
  git config submodule."roms/sgabios".url "${srcdir}/gitlab.com-qemu-project-sgabios"
  git config submodule."roms/skiboot".url "${srcdir}/gitlab.com-qemu-project-skiboot"
  git config submodule."roms/u-boot".url "${srcdir}/gitlab.com-qemu-project-u-boot"
  git config submodule."roms/u-boot-sam460ex".url "${srcdir}/gitlab.com-qemu-project-u-boot-sam460ex"
  git config submodule."roms/vbootrom".url "${srcdir}/gitlab.com-qemu-project-vbootrom"
  git config submodule."subprojects/libvfio-user".url "${srcdir}/gitlab.com-qemu-project-libvfio-user"
  git config submodule."tests/fp/berkeley-softfloat-3".url "${srcdir}/gitlab.com-qemu-project-berkeley-softfloat-3"
  git config submodule."tests/fp/berkeley-testfloat-3".url "${srcdir}/gitlab.com-qemu-project-berkeley-testfloat-3"
  git config submodule."tests/lcitool/libvirt-ci".url "${srcdir}/gitlab.com-libvirt-libvirt-ci"
  git config submodule."tomlplusplus".url "${srcdir}/github.com-marzer-tomlplusplus"
  git config submodule."ui/keycodemapdb".url "${srcdir}/gitlab.com-qemu-project-keycodemapdb"
  git config submodule."ui/thirdparty/imgui".url "${srcdir}/github.com-ocornut-imgui"
  git config submodule."ui/thirdparty/implot".url "${srcdir}/github.com-epezent-implot"

  git -c protocol.file.allow=always submodule update

  # generate license file
  python scripts/gen-license.py > XEMU_LICENSE

  # patch build info
  sed \
    -i scripts/xemu-version.sh \
    -e 's/\$XEMU_BRANCH/master/'
}

build() {
  cd "$pkgname"

  ./configure \
    --audio-drv-list="sdl" \
    --disable-debug-info \
    --extra-cflags="-DXBOX=1" \
    --ninja=samu \
    --target-list=i386-softmmu \
    --with-git-submodules=ignore

  make qemu-system-i386
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 build/qemu-system-i386 "$pkgdir/usr/bin/$pkgname"

  # desktop files
  install -vDm644 -t "$pkgdir/usr/share/applications" ui/xemu.desktop
  for size in 24 32 48 256 512; do
    install -vDm644 "ui/icons/xemu_${size}x${size}.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
  done
  install -vDm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps" ui/icons/xemu.svg

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" XEMU_LICENSE
}
