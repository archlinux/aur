# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Manuel Mendez <mmendez534@gmail.com>
# Submitter: Robin Martinjak <rob@kingofnerds.net>

# vim:set ts=2 sw=2 et:

pkgname='makeself'
pkgver='2.4.5'
pkgrel='1'
pkgdesc='Utility to create self-extracting packages'
arch=('any')
url='http://megastep.org/makeself'
license=('GPL')
depends=('bash')
optdepends=(
  'gzip: compression support'
  'bzip2: compression support'
  'pbzip2: compression support'
  'xz: compression support'
  'lzop: compression support (lzo)'
  'lz4: compression support'
  'zstd: compression support'
  'pigz: compression support'
  # 'base64: encoding support' # coreutils
  'gnupg: encryption support'
  'openssl: encryption support'
  'ncompress: compression support'
  #'md5sum: digest support' # coreutils
  #'sha256sum: digest support' # coreutils
  'tar: archive support'
)
source=("${pkgname}-release-${pkgver}.tar.gz::https://github.com/megastep/${pkgname}/archive/release-${pkgver}.tar.gz")
md5sums=('18bd1c06156cdf2d006ce21a72078e30')
sha256sums=('91deafdbfddf130abe67d7546f0c50be6af6711bb1c351b768043bd527bd6e45')
sha512sums=('1dae74586f6bd5afb526801b7ffa7fc7962ff74b0f190cdd51da93c21421864b72f5fe18090cb2ff6ad27f0907fbf3aeb5545f3f70e33dbc9e505a78505f5f90')

prepare() {
  cd "${pkgname}-release-${pkgver}"
  sed -e 's|^HEADER=.*|HEADER=/usr/share/makeself/makeself-header.sh|' -i 'makeself.sh'
}

package() {
  cd "${pkgname}-release-${pkgver}"
  install -Dpm644 'makeself.lsm' 'README.md' -t "${pkgdir}/usr/share/${pkgname}/"
  install -Dpm644 'makeself.1' -t "${pkgdir}/usr/share/man/man1/"
  install -Dpm755 'makeself.sh' "${pkgdir}/usr/bin/makeself"
  install -Dpm755 'makeself-header.sh' -t "${pkgdir}/usr/share/${pkgname}/"
}

