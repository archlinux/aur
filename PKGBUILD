# Maintainer:  dreieck

pkgname=freetz-ng-devel
pkgver=20240728.01
pkgrel=1
pkgdesc='Metapackage to pull all dependencies required to build freetz-ng'
arch=('any')
url='https://freetz-ng.github.io/freetz-ng/PREREQUISITES'
license=('CC0-1.0')
depends=(
  ## Executables:
  'bash'
  'bc'
  'bison'
  'bzip2'
  'ccache'
  'coreutils'
  'cpio'
  'eclipse-ecj'
  'file'
  'findutils'
  'flex'
  'gawk'
  'gcc'
  'gettext'
  'git'
  'glib2'
  'glib2-devel'
  'glibc'
  'grep'
  'inkscape'
  'kmod'
  'libtool'
  'libxml2'
  'openbsd-netcat'
  'openssl'
  'patch'
  'patchutils'
  'perl'
  'pkgconf'
  'rpcsvc-proto'
  'rsync'
  'sed'
  'sharutils'
  'subversion'
  'tar'
  'unzip'
  'util-linux'
  'xz'
  'zip'

  ## Headers:
  'acl'
  'gnutls'
  'libcap'
  'libelf'
  'ncurses'
  'openssl'
  'readline'
  'sqlite'
  'util-linux-libs'
  'zlib'

  ## Libraries:
  'sqlite'

  ## pkgconfig-files:
  'zstd'
)
optdepends=()

_get_dependencies() {
  ### This is a bash snippet helping to generate the dependency entries when called from within downloaded 'freetz-ng' source.
  #   Maybe 'ccache' and 'glib2-devel' need to be added manually.
  printf '%s\n' '  ## Executables:'; pacman -Qqo `grep -E -e '(^program|^binary)' .prerequisites | awk '{print $2}' | grep .` | sort | uniq | while read i; do printf '%s\n' "  '$i'"; done
  printf '\n'
  printf '%s\n' '  ## Headers:'; pacman -Qqo `grep -E -e '^header' .prerequisites | awk '{print "/usr/include/"$2}' | grep .` | sort | uniq | while read i; do printf '%s\n' "  '$i'"; done
  printf '\n'
  printf '%s\n' '  ## Libraries:'; pacman -Qqo `grep -E -e '^lib' .prerequisites | awk '{print "/usr/lib/"$2}' | grep .` | sort | uniq | while read i; do printf '%s\n' "  '$i'"; done
  printf '\n'
  printf '%s\n' '  ## pkgconfig-files:'; pacman -Qqo `grep -E -e '^pkgconf' .prerequisites | awk '{print "/usr/lib/pkgconfig/"$2}' | grep .` | sort | uniq | while read i; do printf '%s\n' "  '$i'"; done
}
