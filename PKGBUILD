## For build instructions, see https://libguestfs.org/guestfs-building.1.html
# Libguestfs: Installer: Arch
# Maintainer:  dreieck
# Contributor: Csaba Henk <csaba+arch@lowlife.hu>
# Contributor: Nikos Skalkotos <skalkoto (at) Gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Evaggelos Balaskas <eblaskas _AT_ ebalaskas _DOT_ gr>
# Contributor: Peter Wu <peter@lekensteyn.nl>

_pkgname=libguestfs
pkgname="${_pkgname}-git"
epoch=0
pkgver=1.51.7+4.r11933.20231030.0e37e5fee
pkgrel=2
pkgdesc="Access and modify virtual machine disk image"
arch=(
  "i686"
  "x86_64"
)
url="https://libguestfs.org"
license=("GPL2" "LGPL2.1")
backup=(
  "etc/libguestfs-tools.conf"
  "etc/php.d/guestfs_php.ini"
  "etc/xdg/virt-builder/repos.d/libguestfs.conf"
  "etc/xdg/virt-builder/repos.d/libguestfs.gpg"
)
install="appliance.install"
depends=(
  'augeas>=1.2.0'
  'bash'
  'cdrtools' # or 'libisoburn' or 'xorriso'
  'cpio'
  'file' # For libmagic.so
  'gcc-libs'
  'glibc'
  'hivex>=1.2.7'
  'jansson>=2.7'
  'libvirt>=0.10.2'
  'libxml2'
  'linux>=2.6.34'
  'ncurses'
  'psmisc'
  'supermin>=5.1.18'
  'qemu-common>=1.3.0'
  'qemu-img>=1.3.0'
  'xz'
  'zstd'

  #"qemu-headless"
  #"augeas"
  #"hivex>=1.3.2"
  #"libconfig"
  #"fuse"
  #"file"
  #"cpio"
  #"wget"
  #"jansson"
  #"supermin>=5.1"
)
makedepends=(
  'bison'
  'coreutils'
  'flex'
  # 'ei' # To build the Erlang bindings. Note that Erlang ≤ 22 will not work unless you use libguestfs ≤ 1.42.
  'erlang>=23' # To build the Erlang bindings. Note that Erlang ≤ 22 will not work unless you use libguestfs ≤ 1.42.
  'git'
  'gjs' # To build and test the GObject bindings.
  'glib2' # To build and test the GObject bindings.
  # 'gobject-introspection' # To build and test the GObject bindings. Introspection currently deactivated, see comment in `build()`.
  'gperf'
  'autoconf'
  'automake'
  'gcc'
  'gettext'
  # 'ghc' # To build Haskell bindings. Currently deactivated due to errors finding packages. See comment in `build()`.
  'go>=1.1.1' # To build the Go bindings.
  'java-runtime-headless>=1.6'
  'libtool'
  # 'libtirpc'
  'lua' # To build the LUA bindings.
  'ocaml>=4.07'
  'ocaml-augeas'
  'ocaml-findlib'
  'pcre2'
  'perl'
  'perl-pod-parser'
  'php' # To build PHP bindings
  # 'phpize' # To build PHP bindings
  'po4a'
  'python>=3.6'
  'rpcsvc-proto' # For rpcgen
  'ruby'
  'ruby-minitest'
  'ruby-rake'
  'ruby-rdoc'
  'rust' # To build rust bindings.
  # 'vala' # To build the Vala bindings.
  'valgrind' # For testing memory problems.
  'wget'
)
# # 2023-10-14: `check()` disabled, as takes very long, as it creates and tests several virtual machines.
# checkdepends=(
#   "libvirt-python" # For testing Python libvirt/libguestfs interactions.
#   "libxml2" # For xmllint
#   "ntfs-3g" # For testing windows image
#   "ocaml-ounit>=2.0.0" # For testing the common OCaml modules.
#   "perl"
#   "perl-module-build>=0.19"
#   # "perl-test-more"
#   # "perl-test-simple"
#   "python>=3.6"
#   # 'qemu-nbd'
# )
optdepends=(
  "acl: Library and programs for handling POSIX ACLs."
  "bash-completion: For tab-completion of commands in bash."
  "curl: Used by virt-builder for downloads."
  "fuse: fusermount(1), libfuse and kernel module are all needed if you want guestmount(1) and/or mount-local support."
  "gdisk: GPT disk support."
  "gnupg: Used by virt-builder for checking digital signatures."
  "java-runtime>=1.6: For Java bindings."
  "icoutils: Render icons from Windows guests."
  "libcap: Library and programs for handling Linux capabilities."
  "libconfig: To parse libguestfs's own config files."
  "libldm: Library and ldmtool(1) for handling Windows Dynamic Disks."
  "libselinux: Used by the libvirt backend to securely confine the appliance (sVirt)."
  "libsystemd-journal: For accessing systemd journals."
  "libtsk: For filesystem forensics analysis."
  'lua: For LUA bindings.'
  "nbdkit>=1.12"
  "netpbm: Render icons from guests."
  "ocaml: For OCaml bindings."
  "ocaml-augeas: For OCaml augeas binding."
  "ocaml-gettext: For localizing OCaml virt tools."
  "perl: Perl Bindings; Perl module used to test virt-rescue(1)."
  "perl-sys-virt: Sys-Virt tools."
  "php: For PHP bindings."
  "python>=3.6: Python bindings"
  "python-evtx: Used by virt-log(1) to parse Windows Event Log files."
  "readline: For nicer command line editing in guestfish(1)."
  "rpm: To parse the list of applications from RPM-based guests."
  "ruby: For ruby bindings."
  "wget: For '/usr/bin/update-libguestfs-appliance'."
  "yara>=4.0.0: Tool for categorizing files based on their content."
)
provides=(
  "${_pkgname}=${pkgver}"

  #"cargo-guestfs=${pkgver}"
  "erlang-guestfs=${pkgver}"
  #"golang-guestfs=${pkgver}"
  #"haskell-guestfs=${pkgver}"
  "java-guestfs=${pkgver}"
  "lua-guestfs=${pkgver}"
  "ocaml-guestfs=${pkgver}"
  "perl-guestfs=${pkgver}"
  "php-guestfs=${pkgver}"
  "python-guestfs=${pkgver}"
  "ruby-guestfs=${pkgver}"

  "guestfs-bash-completion=${pkgver}"
  "guestfsd=${pkgver}"
  "guestfish=${pkgver}"
  "virt-rescue=${pkgver}"
  "libguestfs.so"
  "libguestfs-gobject-1.0.so"
)
conflicts=(
  "${_pkgname}"
  "guestfsd"
  "guestfish"
  "virt-rescue"
)
source=(
  "${_pkgname}::git+https://github.com/libguestfs/libguestfs.git"
  "gnulib::git+https://git.savannah.gnu.org/git/gnulib.git"
  "libguestfs-common::git+https://github.com/libguestfs/libguestfs-common.git"
  "libguestfs-1.48.1-disable_php_tests.patch::https://gitlab.archlinux.org/archlinux/packaging/packages/libguestfs/-/raw/main/libguestfs-1.48.1-disable_php_tests.patch" # disable php tests, as missing arginfo definition makes them fail: https://github.com/libguestfs/libguestfs/issues/78
  # "libguestfs-1.48.6-ocaml5.patch::https://gitlab.archlinux.org/archlinux/packaging/packages/libguestfs/-/raw/main/libguestfs-1.48.6-ocaml5.patch" # fixes for OCaml >= 5. 2023-10-11: Seems to be present in the git checkout.
  "update-libguestfs-appliance"
  "${install}"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  '151d7ab43e7150c7d645eb0bad9681ce5ecc59cae44f254f08ef617ce3d9932f'
  # 'eb019796aede102254f22b25e10db5751891fbff8c4b7cf2d5786fd58f2b005a'
  '96809e9df6e349b7f5679cd62e42917b42c6f6d5b5b1d6063841d081a83beb27'
  '46ee0c9b3532cbbc38ddce7136b37e30ef71ad7aa004fa2fa552c9f165ee63d5'
)
# LTO breaks linking into OCaml library, e.g. with building the package `virt-v2v`.
options+=('!lto')

prepare() {
  cd "${srcdir}/${_pkgname}"

  git submodule init
  git config submodule.gnulib.url $srcdir/gnulib
  git config submodule.oommon.url $srcdir/libguestfs-common
  git submodule update

  for _patch in "${srcdir}/libguestfs-1.48.1-disable_php_tests.patch"; do
    msg2 "Applying patch '$(basename ${_patch}) ...'"
    patch -N -p1 --follow-symlinks -i "${_patch}"
  done

  autoreconf -fiv
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Could not determine version."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

_fix_pod_files() {
  # work around podfile generation isssue
  rm -f po-docs/podfiles
  make -C po-docs update-po
}

build() {
  cd "${srcdir}/${_pkgname}"

# 2023-10-10: Currently, Haskell bindings are disabled. To enable, change `--disable-haskell` to `--enable-haskell` and add `ghc` to `makedepends`.  
# 2023-10-10: Enabling haskell bindings results in build error:  
# ```
# make[2]: Entering directory '/tmp/makepkg/build/libguestfs-git/src/libguestfs/haskell'
# ghc  -I../lib -L../lib/.libs -i. --make -main-is Guestfs010Load -odir .Guestfs010Load -o Guestfs010Load Guestfs010Load.hs ./Guestfs.hs -lguestfs
# [1 of 2] Compiling Guestfs          ( Guestfs.hs, .Guestfs010Load/Guestfs.o )
# 
# Guestfs.hs:539:1: error:
#     Could not find module ‘Prelude’
#     There are files missing in the ‘base-4.15.1.0’ package,
#     try running 'ghc-pkg check'.
#     Use -v (or `:set -v` in ghci) to see a list of the files searched for.
#     |
# 539 | import Prelude hiding (head, tail, truncate)
#     | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
# 
# Guestfs.hs:541:1: error:
#     Could not find module ‘Foreign’
#     There are files missing in the ‘base-4.15.1.0’ package,
#     try running 'ghc-pkg check'.
#     Use -v (or `:set -v` in ghci) to see a list of the files searched for.
#     |
# 541 | import Foreign
#     | ^^^^^^^^^^^^^^
# 
# Guestfs.hs:542:1: error:
#     Could not find module ‘Foreign.C’
#     There are files missing in the ‘base-4.15.1.0’ package,
#     try running 'ghc-pkg check'.
#     Use -v (or `:set -v` in ghci) to see a list of the files searched for.
#     |
# 542 | import Foreign.C
#     | ^^^^^^^^^^^^^^^^
# 
# Guestfs.hs:543:1: error:
#     Could not find module ‘Foreign.C.Types’
#     There are files missing in the ‘base-4.15.1.0’ package,
#     try running 'ghc-pkg check'.
#     Use -v (or `:set -v` in ghci) to see a list of the files searched for.
#     |
# 543 | import Foreign.C.Types
#     | ^^^^^^^^^^^^^^^^^^^^^^
# 
# Guestfs.hs:544:1: error:
#     Could not find module ‘System.IO’
#     There are files missing in the ‘base-4.15.1.0’ package,
#     try running 'ghc-pkg check'.
#     Use -v (or `:set -v` in ghci) to see a list of the files searched for.
#     |
# 544 | import System.IO
#     | ^^^^^^^^^^^^^^^^
# 
# Guestfs.hs:545:1: error:
#     Could not find module ‘Control.Exception’
#     There are files missing in the ‘base-4.15.1.0’ package,
#     try running 'ghc-pkg check'.
#     Use -v (or `:set -v` in ghci) to see a list of the files searched for.
#     |
# 545 | import Control.Exception
#     | ^^^^^^^^^^^^^^^^^^^^^^^^
# 
# Guestfs.hs:546:1: error:
#     Could not find module ‘Data.Typeable’
#     There are files missing in the ‘base-4.15.1.0’ package,
#     try running 'ghc-pkg check'.
#     Use -v (or `:set -v` in ghci) to see a list of the files searched for.
#     |
# 546 | import Data.Typeable
#     | ^^^^^^^^^^^^^^^^^^^^
# make[2]: *** [Makefile:1285: Guestfs010Load] Error 1
# make[2]: Leaving directory '/tmp/makepkg/build/libguestfs-git/src/libguestfs/haskell'
# make[1]: *** [Makefile:1089: all-recursive] Error 1
# ```

# 2023-10-10: `--enable-introspection=yes` results in build error:  
# ```
# Command '['/tmp/makepkg/build/libguestfs-git/src/libguestfs/gobject/tmp-introspectqgkewund/Guestfs-1.0', '--introspect-dump=/tmp/makepkg/build/libguestfs-git/src/libguestfs/gobject/tmp-introspectqgkewund/functions.txt,/tmp/makepkg/build/libguestfs-git/src/libguestfs/gobject/tmp-introspectqgkewund/dump.xml']' died with <Signals.SIGSEGV: 11>.
# ```  
# If re-enabling, add `gobject-introspection` to `makedepends`.
# Vala is disabled as a consequence: `configure: error: Vala bindings require GObject Introspection`. If enabling, also add `vala` to `makedepends`.

# 2023-10-10: `make` fails with `make: *** No rule to make target 'update-po'.  Stop.`.

  export CARGO_HOME="${srcdir}/.cargo"
  export GOPATH="${srcdir}/.go"
  export GOBIN="${GOPATH}/bin"

  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --libexecdir=/usr/libexec \
    --sysconfdir=/etc \
    --sharedstatedir=/var \
    --localstatedir=/var \
    --runstatedir=/run \
    --libdir=/usr/lib \
    --includedir=/usr/include \
    --oldincludedir=/usr/include \
    --datarootdir=/usr/share \
    --datadir=/usr/share/guestfs \
    --infodir=/usr/share/info \
    --localedir=/usr/share/locale \
    --mandir=/usr/share/man \
    --docdir=/usr/share/doc/"${_pkgname}" \
    --htmldir=/usr/share/doc/"${_pkgname}"/html \
    --dvidir=/usr/share/doc/"${_pkgname}"/dvi \
    --pdfdir=/usr/share/doc/"${_pkgname}"/pdf \
    --psdir=/usr/share/doc/"${_pkgname}"/ps \
    --enable-shared \
    --disable-static \
    --disable-werror \
    --enable-largefile \
    --enable-nls \
    --enable-rpath \
    --enable-packet-dump \
    --enable-fuse \
    --enable-daemon \
    --enable-install-daemon \
    --enable-appliance \
    --enable-appliance-format-auto \
    --enable-ocaml \
    --enable-perl \
    --enable-probes \
    --enable-python \
    --enable-ruby \
    --disable-haskell \
    --enable-php \
    --enable-erlang \
    --enable-lua \
    --enable-golang \
    --enable-gobject \
    --enable-introspection=no \
    --enable-rust \
    --enable-vala=no \
    --with-default-backend=direct \
    --with-extra-packages="openssh" \
    --with-guestfs-path=/usr/lib/guestfs \
    --with-libvirt \
    --with-qemu="qemu-system-x86_64 qemu-system-i386 qemu" \
    --with-readline \
    --with-java

  make
  #if ! make; then
  #  _fix_pod_files
  #  make
  #fi

  # for some reason ruby is not properly made (albeit enabled)
  make -C ruby
}

# # 2023-10-14: `check()` disabled, as takes very long, as it creates and tests several virtual machines.
# check() {
#   cd "${srcdir}/${_pkgname}"
# 
#   export CARGO_HOME="${srcdir}/.cargo"
#   export GOPATH="${srcdir}/.go"
#   export GOBIN="${GOPATH}/bin"
# 
#   # # To sanity check that the build worked, do (warning, this takes very long, as it creates and tests several virtual machines):
#   # make quickcheck
# 
#   # # To run the basic tests, do (warning, this takes very long, as it creates and tests several virtual machines):
#   # make check
# 
#   ## There are many more tests you can run. See guestfs-hacking(1) for details.
# }

package() {
  cd "${srcdir}/${_pkgname}"

  export CARGO_HOME="${srcdir}/.cargo"
  export GOPATH="${srcdir}/.go"
  export GOBIN="${GOPATH}/bin"

  make INSTALLDIRS=vendor DESTDIR="${pkgdir}" install
  #if ! make DESTDIR="${pkgdir}" install; then
  #  _fix_pod_files
  #  make DESTDIR="${pkgdir}" install
  #fi

  # Clean up messed-up installation directories
  mv -v "${pkgdir}/lib"/* "${pkgdir}/usr/lib"/
  rmdir "${pkgdir}/lib"

  install -dvm755 "${pkgdir}/usr/lib/guestfs"
  install -dvm755 "${pkgdir}/var/cache/guestfs"
  install -Dvm755 "${srcdir}/update-libguestfs-appliance" "${pkgdir}/usr/bin/update-libguestfs-appliance"

  for _docfile in AUTHORS HACKING README TODO; do
    install -Dvm644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  for _licensefile in COPYING COPYING.LIB; do
    install -Dvm644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_licensefile}"
  done
}
