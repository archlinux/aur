# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="matlab-gcc-meta"
pkgver=R2025b
pkgrel=6
pkgdesc="A high-level language for numerical computation and visualization"
arch=(
  'any'
)
url="https://www.mathworks.com/support/requirements/supported-compilers-linux.html"
license=(
  '0BSD'
)

declare -Ag _gccs=(
  # ['R11']='' # ???
  # ['R12']='2.95'
  # ['R13']='2.95'
  # ['R14']='3.3' # 3.2 for 32-bit
  # ['R2006a']='3.4' # 3.4.4 not 3.4.5
  # ['R2006b']='3.4'
  # ['R2007a']='4.1'
  # ['R2007b']='4.1' # ???
  # ['R2008a']='4.1'
  # ['R2008b']='4.1'
  # ['R2009a']='4.2'
  # ['R2009b']='4.2'
  # ['R2010a']='4.2'
  # ['R2010b']='4.3'
  # ['R2011a']='4.3'
  # ['R2011b']='4.3'
  # ['R2012a']='4.4'
  # ['R2012b']='4.4'
  # ['R2013a']='4.4'
  # ['R2013b']='4.7'
  # ['R2014a']='4.7'
  # ['R2014b']='4.7'
  # ['R2015a']='4.7'
  # ['R2015b']='4.7'
  # ['R2016a']='4.7'
  # ['R2016b']='4.9'
  # ['R2017a']='4.9'
  # ['R2017b']='4.9'
  ['R2018a']='6' # 6.3 not 6.5
  ['R2018b']='6' # 6.3 not 6.5
  ['R2019a']='6' # 6.3 not 6.5
  ['R2019b']='6' # 6.3 not 6.5
  ['R2020a']='6' # 6.3 not 6.5
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
  # ['R11']='' # ???
  # ['R12']='2.95' # ???
  # ['R13']='2.95' # ???
  # ['R14']='3.3' # 3.2 for 32-bit
  # ['R2006a']='3.4'
  # ['R2006b']='3.4'
  # ['R2007a']='4.1' # 0.90 ???
  # ['R2007b']='4.1' # ???
  # ['R2008a']='4.1' # 0.90 ???
  # ['R2008b']='4.1' # 0.90 ???
  # ['R2009a']='4.2' # 0.90 ???
  # ['R2009b']='4.2' # 0.90 ???
  # ['R2010a']='4.2' # 0.90 ???
  # ['R2010b']='4.3' # 0.90 ???
  # ['R2011a']='4.3'
  # ['R2011b']='4.3'
  # ['R2012a']='4.3'
  # ['R2012b']='4.3'
  # ['R2013a']='4.3'
  # ['R2013b']='4.7'
  # ['R2014a']='4.7'
  # ['R2014b']='4.7'
  # ['R2015a']='4.7'
  # ['R2015b']='4.7'
  # ['R2016a']='4.7'
  # ['R2016b']='4.9'
  # ['R2017a']='4.9'
  # ['R2017b']='4.9'
  ['R2018a']='6' # 6.3 not 6.5
  ['R2018b']='6' # 6.3 not 6.5
  ['R2019a']='6' # 6.3 not 6.5
  ['R2019b']='6' # 6.3 not 6.5
  ['R2020a']='6' # 6.3 not 6.5
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
    local _flag_versioned=0 _flag_multi=0
    local _pkgname="" _pkgdesc=""
    local _provides=() _conflicts=()

    if [[ "${_release}" != "${pkgver}" ]]; then
      _flag_versioned=1
    fi
    if [[ "${_gccs[${_release}]}" == *" "* ]]; then
      _flag_multi=1
    fi

    case "${_flag_versioned}${_flag_multi}" in
      00) # matlab-gcc-meta
        _pkgname="matlab-gcc-meta"
        _pkgdesc="${pkgdesc} (GCC, meta)"
        _provides=(
          "matlab-${_release,,}-gcc-meta=${pkgver}"
        )
        _conflicts=(
          "matlab-${_release,,}-gcc-meta"
        )
        ;;
      01) # matlab-gccN-meta
        _pkgname="matlab-gcc${_gcc}-meta"
        _pkgdesc="${pkgdesc} (GCC${_gcc}, meta)"
        _provides=(
          "matlab-${_release,,}-gcc-meta=${pkgver}"
          "matlab-gcc-meta=${pkgver}"
        )
        _conflicts=(
          "matlab-${_release,,}-gcc-meta"
          "matlab-gcc-meta"
        )
        ;;
      10) # matlab-r20XXy-gcc-meta
        _pkgname="matlab-${_release,,}-gcc-meta"
        _pkgdesc="${pkgdesc} (${_release}, GCC, meta)"
        ;;
      11) # matlab-r20XXy-gccN-meta
        _pkgname="matlab-${_release,,}-gcc${_gcc}-meta"
        _pkgdesc="${pkgdesc} (${_release}, GCC${_gcc}, meta)"
        _provides=(
          "matlab-${_release,,}-gcc-meta=${pkgver}"
        )
        _conflicts=(
          "matlab-${_release,,}-gcc-meta"
        )
        ;;
    esac

    pkgname+=(
      "${_pkgname}"
    )

    eval "
package_${_pkgname}() {
  pkgdesc='${_pkgdesc}'
  depends=(
    'gcc${_gcc//.}'
  )

  $( (( ${#_provides[@]} ))  && echo "provides=( ${_provides[@]} )" )
  $( (( ${#_conflicts[@]} )) && echo "conflicts=( ${_conflicts[@]} )" )

  install -vd \"\${pkgdir}/usr/bin\"
  ln -vsf 'gcc-${_gcc}' \"\${pkgdir}/usr/bin/gcc-matlab-${_release}\"
  ln -vsf 'g++-${_gcc}' \"\${pkgdir}/usr/bin/g++-matlab-${_release}\"

  $( (( ! _flag_versioned )) && cat <<EOF
  ln -vsf 'gcc-${_gcc}' "\${pkgdir}/usr/bin/gcc-matlab"
  ln -vsf 'g++-${_gcc}' "\${pkgdir}/usr/bin/g++-matlab"
EOF
  )
}"
  done
done

for _release in "${!_gcc_fortrans[@]}"; do
  for _gcc_fortran in ${_gcc_fortrans[${_release}]}; do
    local _flag_versioned=0 _flag_multi=0
    local _pkgname="" _pkgdesc=""
    local _provides=() _conflicts=()

    if [[ "${_release}" != "${pkgver}" ]]; then
      _flag_versioned=1
    fi
    if [[ "${_gcc_fortrans[${_release}]}" == *" "* ]]; then
      _flag_multi=1
    fi

    case "${_flag_versioned}${_flag_multi}" in
      00) # matlab-gcc-fortran-meta
        _pkgname="matlab-gcc-fortran-meta"
        _pkgdesc="${pkgdesc} (GCC Fortran, meta)"
        _provides=(
          "matlab-${_release,,}-gcc-fortran-meta=${pkgver}"
        )
        _conflicts=(
          "matlab-${_release,,}-gcc-fortran-meta"
        )
        ;;
      01) # matlab-gccN-fortran-meta
        _pkgname="matlab-gcc${_gcc}-fortran-meta"
        _pkgdesc="${pkgdesc} (GCC${_gcc} Fortran, meta)"
        _provides=(
          "matlab-${_release,,}-gcc-fortran-meta=${pkgver}"
          "matlab-gcc-fortran-meta=${pkgver}"
        )
        _conflicts=(
          "matlab-${_release,,}-gcc-fortran-meta"
          "matlab-gcc-fortran-meta"
        )
        ;;
      10) # matlab-r20XXy-gcc-fortran-meta
        _pkgname="matlab-${_release,,}-gcc-fortran-meta"
        _pkgdesc="${pkgdesc} (${_release}, GCC Fortran, meta)"
        ;;
      11) # matlab-r20XXy-gccN-fortran-meta
        _pkgname="matlab-${_release,,}-gcc${_gcc}-fortran-meta"
        _pkgdesc="${pkgdesc} (${_release}, GCC${_gcc} Fortran, meta)"
        _provides=(
          "matlab-${_release,,}-gcc-fortran-meta=${pkgver}"
        )
        _conflicts=(
          "matlab-${_release,,}-gcc-fortran-meta"
        )
        ;;
    esac

    pkgname+=(
      "${_pkgname}"
    )

    eval "
package_${_pkgname}() {
  pkgdesc='${_pkgdesc}'
  depends=(
    'gcc${_gcc//.}-fortran'
  )

  $( (( ${#_provides[@]} ))  && echo "provides=( ${_provides[@]} )" )
  $( (( ${#_conflicts[@]} )) && echo "conflicts=( ${_conflicts[@]} )" )

  install -vd \"\${pkgdir}/usr/bin\"
  ln -vsf 'gfortran-${_gcc}' \"\${pkgdir}/usr/bin/gfortran-matlab-${_release}\"

  $( (( ! _flag_versioned )) && cat <<EOF
  ln -vsf 'gfortran-${_gcc}' "\${pkgdir}/usr/bin/gfortran-matlab"
EOF
  )
}"
  done
done
