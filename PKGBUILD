# Maintainer: h8red  h8red at yandex dot ru
# Contributor: Mattia Dongili <Mattia Dongili>

pkgname=cpufrequtils
pkgver=008
pkgrel=3
pkgdesc="This package provides very useful tools to get information about the CPUFreq"
arch=('x86_64' 'aarch64')
url="https://mirrors.edge.kernel.org/pub/linux/utils/kernel/cpufreq/cpufreq-info.html"
license=('GPL2')
source=("https://mirrors.edge.kernel.org/pub/linux/utils/kernel/cpufreq/$pkgname-$pkgver.tar".{xz,sign}
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
    '11_dont_touch_po_files.patch')
md5sums=('e0c9f333a9546f71d17fd5a0546db79e'
    'SKIP'
    '9ed71a50670aa99e12245cb3f5199142'
    '4ccbd46b0b1563067d0c31fe510ff89d'
    '5dd9add84e63b213295e2e2a30fd3667'
    '2f7a864539dd0db18b6ff0d77873a8b2'
    '139b340b964e2c942dbe426b061c6bc8'
    '2242f015ca6b8478d6c1a3bfbca5ea48'
    '0b7d50274fa8286796c9df0b156e2962'
    'a99653aab0d334569496a402389f062f'
    '35dc88b7dfa18276b094355467957022'
    '6e08e20d319d70770b90be548027503f'
    'a837db201e0bb724ccf617757a575e26')
validpgpkeys=(
'DD46DC35691C79509D15F58CFEF39108F6FD2C20' # Dominik Brodowski
)
build() {
  cd ${srcdir}

  cd ${pkgname}-${pkgver}

  patch -p1 < ${srcdir}/01_add_cpufreq-aperf_manpage.patch
  patch -p1 < ${srcdir}/0001-Only-x86-has-cpuid-instruction.patch
  #patch -p1 < ${srcdir}/0002-cpufrequtils-Remove-proc-compile-option-and-interfac.patch
  patch -p1 < ${srcdir}/0003-cpufrequtils-aperf-Fix-MSR-read-on-32-bit.patch
  patch -p1 < ${srcdir}/0004-i18n-Catalan.patch
  patch -p1 < ${srcdir}/0005-cpufrequtils-sysfs-increase-MAX_LINE_LEN.patch
  patch -p1 < ${srcdir}/0006-aperf-fix-compilation-on-x86-32-with-fPIC.patch
  patch -p1 < ${srcdir}/0007-po-add-missing-word-in-DE.patch
  patch -p1 < ${srcdir}/0008-cpufrequtils-make-NLS-optional.patch
  patch -p1 < ${srcdir}/10_build_static_lib.patch
  patch -p1 < ${srcdir}/11_dont_touch_po_files.patch
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install || return 1
}
