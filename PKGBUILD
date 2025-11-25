# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="matlab-gcc"
pkgver=R2025b
pkgrel=1
pkgdesc="A high-level language for numerical computation and visualization"
arch=(
  'any'
)
url="https://www.mathworks.com/support/requirements/supported-compilers-linux.html"
license=(
  'custom:None'
)

declare -Ag _gccs=(
  # ['R11']=''
  # ['R12']=''
  # ['R13']=''
  # ['R14']=''
  # ['R2006a']=''
  # ['R2006b']=''
  # ['R2007a']=''
  # ['R2007b']=''
  # ['R2008a']=''
  # ['R2008b']=''
  # ['R2009a']=''
  # ['R2009b']=''
  # ['R2010a']=''
  # ['R2010b']=''
  # ['R2011a']=''
  # ['R2011b']=''
  # ['R2012a']=''
  # ['R2012b']=''
  # ['R2013a']=''
  # ['R2013b']=''
  # ['R2014a']=''
  # ['R2014b']=''
  # ['R2015a']=''
  # ['R2015b']=''
  # ['R2016a']=''
  # ['R2016b']=''
  # ['R2017a']=''
  # ['R2017b']=''
  # ['R2018a']=''
  # ['R2018b']=''
  # ['R2019a']=''
  # ['R2019b']=''
  # ['R2020a']=''
  ['R2020b']='7 8 9'
  ['R2021a']='7 8 9'
  ['R2021b']='7 8 9'
  ['R2022a']='7 8 9 10'
  ['R2022b']='7 8 9 10'
  ['R2023a']='7 8 9 10'
  ['R2023b']='8 9 10 11'
  ['R2024a']='8 9 10 11 12'
  ['R2024b']='8 9 10 11 12'
  ['R2025a']='8 9 10 11 12 13'
  ['R2025b']='8 9 10 11 12 13'
)

declare -Ag _gcc_fortrans=(
  # ['R11']=''
  # ['R12']=''
  # ['R13']=''
  # ['R14']=''
  # ['R2006a']=''
  # ['R2006b']=''
  # ['R2007a']=''
  # ['R2007b']=''
  # ['R2008a']=''
  # ['R2008b']=''
  # ['R2009a']=''
  # ['R2009b']=''
  # ['R2010a']=''
  # ['R2010b']=''
  # ['R2011a']=''
  # ['R2011b']=''
  # ['R2012a']=''
  # ['R2012b']=''
  # ['R2013a']=''
  # ['R2013b']=''
  # ['R2014a']=''
  # ['R2014b']=''
  # ['R2015a']=''
  # ['R2015b']=''
  # ['R2016a']=''
  # ['R2016b']=''
  # ['R2017a']=''
  # ['R2017b']=''
  # ['R2018a']=''
  # ['R2018b']=''
  # ['R2019a']=''
  # ['R2019b']=''
  # ['R2020a']=''
  ['R2020b']='8'
  ['R2021a']='8'
  ['R2021b']='8'
  ['R2022a']='10'
  ['R2022b']='10'
  ['R2023a']='10'
  ['R2023b']='10'
  ['R2024a']='10'
  ['R2024b']='10'
  ['R2025a']='10'
  ['R2025b']='10'
)

for _release in "${!_gccs[@]}"; do
  for _gcc in ${_gccs[${_release}]}; do
    pkgname+=(
      "matlab-${_release,,}-gcc${_gcc}"
    )

  eval "
package_matlab-${_release,,}-gcc${_gcc}() {
  pkgdesc+=' (${_release}, GCC${_gcc} runtime dependency)'
  depends=(
    'gcc${_gcc}'
  )
  provides=(
    'matlab-${_release,,}-gcc=${_gcc}'
  )
  conflicts=(
    'matlab-${_release,,}-gcc'
  )

  install -vd \"\${pkgdir}/usr/bin\"
  ln -vsf 'gcc-${_gcc}' \"\${pkgdir}/usr/bin/gcc-matlab-${_release}\"
}"
  done
done

for _release in "${!_gcc_fortrans[@]}"; do
  for _gcc_fortran in ${_gcc_fortrans[${_release}]}; do
    pkgname+=(
      "matlab-${_release,,}-gcc${_gcc_fortran}-fortran"
    )

  eval "
package_matlab-${_release,,}-gcc${_gcc_fortran}-fortran() {
  pkgdesc+=' (${_release}, GCC${_gcc_fortran} Fortran runtime dependency)'
  depends=(
    'gcc${_gcc_fortran}-fortran'
  )
  provides=(
    'matlab-${_release,,}-gcc-fortran=${_gcc_fortran}'
  )
  conflicts=(
    'matlab-${_release,,}-gcc-fortran'
  )

  install -vd \"\${pkgdir}/usr/bin\"
  ln -vsf 'gfortran-${_gcc_fortran}' \"\${pkgdir}/usr/bin/gfortran-matlab-${_release}\"
}"
  done
done
