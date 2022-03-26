# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=PiFmRds
pkgname=pi-fm-rds-git
_name=${pkgname%-git}
pkgver=75.3f8ebae
pkgrel=1
arch=('armv6h' 'armv7h' 'aarch64')
pkgdesc="FM-RDS transmitter using the Raspberry Pi's PWM"
license=('GPL-3.0')
depends=('libsndfile')
optdepends=('python-scipy: generate_pulses and generate_waveforms'
            'python-numpy: generate_pulses and generate_waveforms'
            'python-matplotlib: generate_waveforms'
            'python-pydemod: generate_waveforms')
makedepends=('git')
provides=("${_name}")
conflicts=("${_name}")
url="https://github.com/ChristopheJacquet/${_reponame}"
source=("${_reponame}::git+https://github.com/ChristopheJacquet/${_reponame}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_reponame"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_reponame/src"
  make
  make rds_wav
}

package() {
  cd "$srcdir/$_reponame/src"
  install -Dm0755 "pi_fm_rds" "$pkgdir/usr/bin/pi_fm_rds"
  install -Dm0755 "rds_wav" "$pkgdir/usr/bin/rds_wav"
  install -Dm0755 "generate_pulses.py" "$pkgdir/usr/bin/generate_pulses"
  install -Dm0755 "generate_waveforms.py" "$pkgdir/usr/bin/generate_waveforms"
}
