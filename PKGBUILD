# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contriburor: h8red  h8red at yandex dot ru
# Contributor: Mattia Dongili <Mattia Dongili>

pkgname=cpufrequtils
pkgver=008
pkgrel=4
pkgdesc="This package provides very useful tools to get information about the CPUFreq and to set."
arch=('x86_64' 'aarch64' 'i686')
url="https://kernel.org/pub/linux/utils/kernel/cpufreq/cpufreq-info.html"
license=('GPL-2.0-only')
depends=(
  "glibc"
  "linux"
)
provides=(
  "libcpufreq.so"
)
conflicts=(
  "cpupower"  # Conflict over /usr/lib/libcpupower.so*
)
source=(
  "https://mirrors.edge.kernel.org/pub/linux/utils/kernel/cpufreq/$pkgname-$pkgver.tar".{xz,sign}
  '0001-Only-x86-has-cpuid-instruction.patch'
  '0002-cpufrequtils-Remove-proc-compile-option-and-interfac.patch'
  '0003-cpufrequtils-aperf-Fix-MSR-read-on-32-bit.patch'
  '0004-i18n-Catalan.patch'
  '0005-cpufrequtils-sysfs-increase-MAX_LINE_LEN.patch'
  '0006-aperf-fix-compilation-on-x86-32-with-fPIC.patch'
  '0007-po-add-missing-word-in-DE.patch'
  '0008-cpufrequtils-make-NLS-optional.patch'
  '01_add_cpufreq-aperf_manpage.patch'
  '10_build_static_lib.patch'
  '11_dont_touch_po_files.patch'
)
sha256sums=(
  'a2149db551f83112209b1a8e79bd50d386979bbf64edbc69126f4e0b4f0a4cab'
  'b052ea90b7ff22301399be250081706ca8a88710b961f4a139b5586a1952da61'
  '6793e7e330fe6c9125c998011f203a4d8d5887872178fc872861db1d5dce55ef'
  '62efd52ea004e1974a09cc5646fbc18d47b372a54ed33361fb2c8470bd931501'
  '5ef9bae9272f867c0187ba0b4845888cf6bb567a4a242da5001b3a4a05935a2c'
  '68ec77ba159559e2b4acbefc707bf521acad55edee3b8a1770618f2eefc64112'
  '76038bb0197d02c91b7dfde5e65cab9379526bba02cb2bab751bbf23a63b392e'
  '99b2b04301f1656ea263e5d693be701be8af40880747fd3e34c9c27e5540eefa'
  '245f1c9db3f8120eb014f782476df6a38c22700dd438d532943ad35f4e4ca46d'
  'bb1cba04abb42843085ea4f2b38d539cfe7d4db93ffaca453891ee2de6c6feac'
  '4254edbbb2c75973ebc2559fffd889c61b606ad47f77e2069e8c401d0cbcd3b5'
  '13ca732b0644037f8b122bdd12ba1a616884b92c98d4bde231e58bb886901419'
  '0e4d443e694ac2df45b3b1be2bbef42c12e54a81090439f1c8e06103c1a8b25d'
)
validpgpkeys=(
  'DD46DC35691C79509D15F58CFEF39108F6FD2C20' # Dominik Brodowski
)
build() {
  cd "${srcdir}"

  cd "${pkgname}-${pkgver}"

  patch -p1 < "${srcdir}"/01_add_cpufreq-aperf_manpage.patch
  patch -p1 < "${srcdir}"/0001-Only-x86-has-cpuid-instruction.patch
  #patch -p1 < "${srcdir}"/0002-cpufrequtils-Remove-proc-compile-option-and-interfac.patch
  patch -p1 < "${srcdir}"/0003-cpufrequtils-aperf-Fix-MSR-read-on-32-bit.patch
  patch -p1 < "${srcdir}"/0004-i18n-Catalan.patch
  patch -p1 < "${srcdir}"/0005-cpufrequtils-sysfs-increase-MAX_LINE_LEN.patch
  patch -p1 < "${srcdir}"/0006-aperf-fix-compilation-on-x86-32-with-fPIC.patch
  patch -p1 < "${srcdir}"/0007-po-add-missing-word-in-DE.patch
  patch -p1 < "${srcdir}"/0008-cpufrequtils-make-NLS-optional.patch
  patch -p1 < "${srcdir}"/10_build_static_lib.patch
  patch -p1 < "${srcdir}"/11_dont_touch_po_files.patch
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install || return 1
}
