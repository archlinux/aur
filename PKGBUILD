# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=elastix
pkgname=${_pkgname}-git
pkgver=4.9.0.r0.g6e031631
pkgrel=5
pkgdesc='Toolbox for rigid and nonrigid registration of images'
arch=('x86_64')
url='http://elastix.isi.uu.nl/'
license=('apache')
provides=('elastix')
depends=('insight-toolkit')
makedepends=('cmake')
optdepends=()
conflicts=('elastix-bin' 'elastix')
source=('git+https://github.com/SuperElastix/elastix.git')
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | \
	  sed 's/^elastix_0//;s/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"

	git checkout master

	mkdir build || :
	cd build

	cmake \
		-DCMAKE_INSTALL_PREFIX:PATH="/usr" \
		-DCMAKE_BUILD_TYPE:STRING=Release \
		-DCMAKE_CXX_FLAGS:STRING="--std=c++11" \
		-DBUILD_TESTING:BOOL=OFF \
		-DBUILD_SHARED_LIBS:BOOL=ON \
		-DELASTIX_IMAGE_2D_PIXELTYPES:STRING="unsigned char;short;float" \
		-DELASTIX_IMAGE_3D_PIXELTYPES:STRING="unsigned char;short;float" \
		-DELASTIX_IMAGE_4D_PIXELTYPES:STRING="unsigned char;short;float" \
		-DELASTIX_BUILD_EXECUTABLE:BOOL=ON \
		-DELASTIX_USE_OPENCL:BOOL=OFF \
		-DELASTIX_USE_OPENMP:BOOL=ON \
		-DELASTIX_USE_EIGEN:BOOL=OFF \
		-DUSE_ALL_COMPONENTS:BOOL=OFF \
		-DUSE_AdaptiveStochasticGradientDescent:BOOL=ON \
		-DUSE_AdvancedAffineTransformElastix:BOOL=ON \
		-DUSE_AdvancedBSplineTransform:BOOL=ON \
		-DUSE_AdvancedKappaStatisticMetric:BOOL=ON \
		-DUSE_AdvancedMattesMutualInformationMetric:BOOL=ON \
		-DUSE_AdvancedMeanSquaresMetric:BOOL=ON \
		-DUSE_AdvancedNormalizedCorrelationMetric:BOOL=ON \
		-DUSE_AffineDTITransformElastix:BOOL=ON \
		-DUSE_AffineLogTransformElastix:BOOL=OFF \
		-DUSE_BSplineInterpolator:BOOL=ON \
		-DUSE_BSplineInterpolatorFloat:BOOL=ON \
		-DUSE_BSplineResampleInterpolator:BOOL=ON \
		-DUSE_BSplineResampleInterpolatorFloat:BOOL=ON \
		-DUSE_BSplineStackTransform:BOOL=ON \
		-DUSE_BSplineTransformWithDiffusion:BOOL=ON \
		-DUSE_CMAEvolutionStrategy:BOOL=ON \
		-DUSE_ConjugateGradient:BOOL=ON \
		-DUSE_ConjugateGradientFRPR:BOOL=ON \
		-DUSE_CorrespondingPointsEuclideanDistanceMetric:BOOL=ON \
		-DUSE_DeformationFieldTransform:BOOL=ON \
		-DUSE_DisplacementMagnitudePenalty:BOOL=ON \
		-DUSE_DistancePreservingRigidityPenalty:BOOL=ON \
		-DUSE_EulerTransformElastix:BOOL=ON \
		-DUSE_FiniteDifferenceGradientDescent:BOOL=ON \
		-DUSE_FixedGenericPyramid:BOOL=ON \
		-DUSE_FixedRecursivePyramid:BOOL=ON \
		-DUSE_FixedShrinkingPyramid:BOOL=ON \
		-DUSE_FixedSmoothingPyramid:BOOL=ON \
		-DUSE_FullSampler:BOOL=ON \
		-DUSE_FullSearch:BOOL=ON \
		-DUSE_GradientDifferenceMetric:BOOL=ON \
		-DUSE_GridSampler:BOOL=ON \
		-DUSE_KNNGraphAlphaMutualInformationMetric:BOOL=OFF \
		-DUSE_LinearInterpolator:BOOL=ON \
		-DUSE_LinearResampleInterpolator:BOOL=ON \
		-DUSE_MissingStructurePenalty:BOOL=ON \
		-DUSE_MovingRecursivePyramid:BOOL=ON \
		-DUSE_MovingShrinkingPyramid:BOOL=ON \
		-DUSE_MovingSmoothingPyramid:BOOL=ON \
		-DUSE_MultiBSplineTransformWithNormal:BOOL=ON \
		-DUSE_MultiInputRandomCoordinateSampler:BOOL=ON \
		-DUSE_MultiMetricMultiResolutionRegistration:BOOL=ON \
		-DUSE_MultiResolutionRegistration:BOOL=ON \
		-DUSE_MultiResolutionRegistrationWithFeatures:BOOL=ON \
		-DUSE_MutualInformationHistogramMetric:BOOL=ON \
		-DUSE_MyStandardResampler:BOOL=ON \
		-DUSE_NearestNeighborInterpolator:BOOL=ON \
		-DUSE_NearestNeighborResampleInterpolator:BOOL=ON \
		-DUSE_NormalizedGradientCorrelationMetric:BOOL=ON \
		-DUSE_NormalizedMutualInformationMetric:BOOL=ON \
		-DUSE_OpenCLFixedGenericPyramid:BOOL=OFF \
		-DUSE_OpenCLMovingGenericPyramid:BOOL=OFF \
		-DUSE_OpenCLResampler:BOOL=OFF \
		-DUSE_PatternIntensityMetric:BOOL=ON \
		-DUSE_PolydataDummyPenalty:BOOL=ON \
		-DUSE_Powell:BOOL=ON \
		-DUSE_QuasiNewtonLBFGS:BOOL=ON \
		-DUSE_RSGDEachParameterApart:BOOL=ON \
		-DUSE_RandomCoordinateSampler:BOOL=ON \
		-DUSE_RandomSampler:BOOL=ON \
		-DUSE_RandomSamplerSparseMask:BOOL=ON \
		-DUSE_RayCastInterpolator:BOOL=ON \
		-DUSE_RayCastResampleInterpolator:BOOL=ON \
		-DUSE_ReducedDimensionBSplineInterpolator:BOOL=ON \
		-DUSE_ReducedDimensionBSplineResampleInterpolator:BOOL=ON \
		-DUSE_RegularStepGradientDescent:BOOL=ON \
		-DUSE_SimilarityTransformElastix:BOOL=ON \
		-DUSE_Simplex:BOOL=ON \
		-DUSE_SimultaneousPerturbation:BOOL=ON \
		-DUSE_SplineKernelTransform:BOOL=ON \
		-DUSE_StandardGradientDescent:BOOL=ON \
		-DUSE_StatisticalShapePenalty:BOOL=ON \
		-DUSE_TransformBendingEnergyPenalty:BOOL=ON \
		-DUSE_TransformRigidityPenalty:BOOL=ON \
		-DUSE_TranslationTransformElastix:BOOL=ON \
		-DUSE_VarianceOverLastDimensionMetric:BOOL=ON \
		-DUSE_ViolaWellsMutualInformationMetric:BOOL=ON \
		-DUSE_WeightedCombinationTransformElastix:BOOL=ON \
		..
}

build() {
	cd "${srcdir}/${_pkgname}/build"
	make
}

package() {
	cd "${srcdir}/${_pkgname}/build"

	make install DESTDIR="${pkgdir}"

	cd ..

	install -D -m644 \
		"LICENSE" \
		"$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

	install -D -m644 \
		"NOTICE" \
		"$pkgdir/usr/share/licenses/$_pkgname/NOTICE"
}
